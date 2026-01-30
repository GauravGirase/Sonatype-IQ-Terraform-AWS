resource "aws_vpc" "iq_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "ref-arch-iq-vpc"
    Project     = "nexus-iq-server"
  }
}