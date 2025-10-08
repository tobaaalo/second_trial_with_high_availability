# Create a new VPC to launch our instances into
resource "aws_vpc" "custom2" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "custom2_vpc"
  }
}