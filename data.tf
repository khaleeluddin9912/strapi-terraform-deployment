# Get default VPC
data "aws_vpc" "vpc_default" {
  default = true
}

# Get all subnets inside default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_default.id]
  }
}