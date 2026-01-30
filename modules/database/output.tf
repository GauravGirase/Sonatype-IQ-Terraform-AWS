output "db_instance_iq_db_address" {
    value = aws_db_instance.iq_db.address
}

output "db_instance_iq_db_name" {
    value = aws_db_instance.iq_db.db_name
}

output "db_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.iq_db.endpoint
  sensitive   = true
}

output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.iq_db.id
}

output "db_instance_port" {
  description = "RDS instance port"
  value       = aws_db_instance.iq_db.port
}

output "db_credentials_secret_arn" {
  description = "ARN of the database credentials secret"
  value       = aws_secretsmanager_secret.db_credentials.arn
  sensitive   = true
}