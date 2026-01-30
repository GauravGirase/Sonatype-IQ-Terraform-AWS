output "load_balancer_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.iq_alb.dns_name
}

output "load_balancer_zone_id" {
  description = "Zone ID of the load balancer"
  value       = aws_lb.iq_alb.zone_id
}

output "load_balancer_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.iq_alb.arn
}

output "application_url" {
  description = "URL to access Nexus IQ Server"
  value       = "http://${aws_lb.iq_alb.dns_name}"
}