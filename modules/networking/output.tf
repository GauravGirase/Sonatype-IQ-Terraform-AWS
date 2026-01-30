output "aws_security_group_ecs_tasks_id" {
  value = aws_security_group.ecs_tasks.id
}

output "aws_security_group_efs_id" {
  value = aws_security_group.efs.id
}

output "aws_security_group_alb_id" {
  value = aws_security_group.alb.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}

output "vpc_id" {
  value = aws_vpc.iq_vpc.id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.iq_vpc.cidr_block
}