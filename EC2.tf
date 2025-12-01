resource "aws_key_pair" "khaleel_key" {
  key_name   = "khaleel-key"
  public_key = file("${path.module}/khaleel-key.pub")
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.khaleel_key.key_name
  subnet_id                   = local.selected_subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = file("${path.module}/user-data.sh")

  root_block_device {
    volume_size = var.volume_size    
    volume_type = "gp3"    
    delete_on_termination = true
  }

  tags = {
    Name = "strapi-ec2"
  }
}

