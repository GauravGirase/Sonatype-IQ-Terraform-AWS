# Networking

module "vpc" {
    source = "./modules/networking"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    db_subnet_cidrs = var.db_subnet_cidrs
}
# Security Group

# ALB

# ECS

# S3

# LOGGING
