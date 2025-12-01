locals {
  selected_subnet_id = data.aws_subnets.default.ids[0]
}