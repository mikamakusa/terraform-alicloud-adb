provider "alicloud" {}

variable "username" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

module "basic" {
  source = "../../"
  db_clusters = [
    {
      db_cluster_category = "MixedStorage"
      mode                = "flexible"
      accounts = [
        {
          account_name     = var.username
          account_password = var.password
        }
      ]
      backup_policies = [
        {
          preferred_backup_period = ["Tuesday", "Wednesday"]
          preferred_backup_time   = "10:00Z-11:00Z"
        }
      ]
      resource_groups = [
        {
          group_name = "TF_EXAMPLE"
        }
      ]
    }
  ]
}