variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "ami_id" {
  description = "Ubuntu Linux  AMI"
  type        = string
  default     = "ami-0e7938ad51d883574" 
}

variable "volume_size" {
  description = "Root EBS volume size for EC2 instance"
  type        = number
  default     = 30
}
