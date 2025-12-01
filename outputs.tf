output "ec2_public_ip" {
  description = "Public IP of Strapi EC2"
  value       = aws_instance.my_instance.public_ip
}

output "strapi_url" {
  description = "Strapi URL"
  value       = "http://${aws_instance.my_instance.public_ip}:1337"
}

output "ssh_command" {
  description = "SSH command to access the EC2 instance"
  value       = "ssh -i <path-to-your-private-key> ubuntu@${aws_instance.my_instance.public_ip}"
}
