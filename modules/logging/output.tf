output "cloudwatch_log_group" {
  description = "Name of the unified CloudWatch log group for all IQ Server logs"
  value       = aws_cloudwatch_log_group.iq_logs.name
}