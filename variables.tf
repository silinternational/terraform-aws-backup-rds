/*
 * Required variables
 */
variable "app_name" {
  type = string
}

variable "app_env" {
  type = string
}

variable "source_arns" {
  description = "The arn's of the source databases"
  type        = list(string)
}


/*
 * Optional variables
 */

variable "backup_cron_schedule" {
  default = "11 1 * * ? *" # Every day at 01:11 UTC
}

variable "notification_events" {
  description = "The arn's of the source databases"
  type        = list(string)
  default     = ["BACKUP_JOB_STARTED", "BACKUP_JOB_COMPLETED", "BACKUP_JOB_FAILED", "RESTORE_JOB_COMPLETED"]
}

variable "sns_topic_arn" {
  description = "The SNS topic to use for notifications. Leave blank to create a topic named backup-vault-events."
  type        = string
  default     = ""
}
