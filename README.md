# terraform-aws-backup-rds

This module is used to create scheduled backups of AWS RDS databases.

## Resources Managed

* KMS Encryption key
* Backup Vault
* Backup Plan
* Backup Selection
* IAM Role and Policy
* SNS Topic and Policy
* Backup Vault Notifications

## Required Inputs

- `app_name` - Name of application, ex: Doorman, IdP, etc.
- `app_env` - Name of environment, ex: prod, test, etc.
- `source_arns` - List of ARN's of the databases to backup

### Optional Inputs

- `backup_cron_schedule` - Default: "11 1 * * ? *"
- `notification_events` - Default: ["BACKUP_JOB_STARTED", "BACKUP_JOB_COMPLETED", "BACKUP_JOB_FAILED", "RESTORE_JOB_COMPLETED"]

## Outputs

- `bkup_key_id` - The backup key ID
- `bkup_key_arn` - The backup key ARN
- `bkup_vault_arn` - The backup vault ARN
- `bkup_cron_scheduled` - The cron schedule for making backups
- `sns_notification_events` - The events that trigger SNS notifications

## Example Usage

```hcl
module "backup_rds" {
  source = "silinternational/backup-rds/aws"
  app_name = var.app_name
  app_env = var.app_env
  source_arns = ["arn:aws:rds:us-east-1:123456789012:db:my-db"]
  backup_cron_schedule = "11 1 * * ? *"
  notification_events = ["BACKUP_JOB_STARTED", "BACKUP_JOB_COMPLETED", "BACKUP_JOB_FAILED", "RESTORE_JOB_COMPLETED"]
}
```
