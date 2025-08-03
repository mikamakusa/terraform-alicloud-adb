output "db_cluster" {
  description = "Informations relatives au cluster MysqlDB."
  value = {
    for a in alicloud_adb_db_cluster.this : a => {
      id                = a.id
      connection_string = a.connection_string
      port              = a.port
      status            = a.status
    }
  }
}

output "account" {
  description = "Informations relatives au comptes des cluster MysqlDB."
  value = {
    for a in alicloud_adb_account.this : a => {
      id                  = a.id
      account_description = a.account_description
      account_name        = a.account_name
      account_password    = sensitive(a.account_password)
      account_type        = a.account_type
    }
  }
}

output "backup_policy" {
  description = "Informations relatives à la politique liée au backup."
  value = {
    for a in alicloud_adb_backup_policy.this : a => {
      id                      = a.id
      backup_retention_period = a.backup_retention_period
      preferred_backup_period = a.preferred_backup_period
      preferred_backup_time   = a.preferred_backup_time
    }
  }
}

output "connection" {
  description = "Informations de connection aux cluster mysqlDB."
  value = {
    for a in alicloud_adb_connection.this : a => {
      id                = a.id
      connection_string = a.connection_string
      port              = a.port
      ip_address        = a.ip_address
    }
  }
}

output "resource_group" {
  value = {
    for a in alicloud_adb_resource_group.this : a => {
      id         = a.id
      group_name = a.group_name
      group_type = a.group_type
      user       = a.user
    }
  }
}

output "db_cluster_lake_version" {
  value = {
    for a in alicloud_adb_db_cluster_lake_version.this : a => {
      id                            = a.id
      status                        = a.status
      payment_type                  = a.payment_type
      create_time                   = a.create_time
      port                          = a.port
      zone_id                       = a.zone_id
      engine                        = a.engine
      backup_set_id                 = a.backup_set_id
      commodity_code                = a.commodity_code
      compute_resource              = a.compute_resource
      connection_string             = a.connection_string
      db_cluster_description        = a.db_cluster_description
      db_cluster_version            = a.db_cluster_version
      enable_default_resource_group = a.enable_default_resource_group
      engine_version                = a.engine_version
      lock_mode                     = a.lock_mode
      lock_reason                   = a.lock_reason
    }
  }
}

output "lake_account" {
  value = {
    for a in alicloud_adb_lake_account.this : a => {
      id                  = a.id
      status              = a.status
      account_description = a.account_description
      account_name        = a.account_name
      account_password    = sensitive(a.account_password)
      account_privileges  = a.account_privileges
      account_type        = a.account_type
    }
  }
}
