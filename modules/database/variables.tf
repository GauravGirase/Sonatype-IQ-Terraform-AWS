variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "nexusiq"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Initial allocated storage for RDS in GB"
  type        = number
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage for RDS in GB"
  type        = number
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
}

variable "db_backup_retention_period" {
  description = "Database backup retention period in days"
  type        = number
}

variable "db_backup_window" {
  description = "Database backup window"
  type        = string
}

variable "db_maintenance_window" {
  description = "Database maintenance window"
  type        = string
}

variable "db_skip_final_snapshot" {
  description = "Skip final snapshot when deleting database"
  type        = bool
}

variable "db_deletion_protection" {
  description = "Enable deletion protection for database"
  type        = bool
}

variable "aws_security_group_rds_id" {
    description = "SG for RDS"
    type = string
}