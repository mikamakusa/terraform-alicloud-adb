resource "alicloud_adb_db_cluster" "this" {
  for_each                 = { for cluster in var.db_clusters : cluster.mode => cluster }
  db_cluster_category      = each.value.db_cluster_category
  mode                     = each.value.mode
  auto_renew_period        = each.value.payment_type == "Subscription" ? each.value.auto_renew_period : null
  compute_resource         = each.value.compute_resource
  db_cluster_version       = each.value.db_cluster_version
  db_node_class            = each.value.db_node_class
  db_node_count            = each.value.db_node_count
  db_node_storage          = each.value.db_node_storage
  description              = each.value.description
  elastic_io_resource      = each.value.elastic_io_resource
  elastic_io_resource_size = each.value.elastic_io_resource_size
  maintain_time            = each.value.maintain_time
  modify_type              = each.value.modify_type
  payment_type             = each.value.payment_type
  period                   = each.value.payment_type == "Subscription" ? each.value.period : null
  renewal_status           = each.value.renewal_status
  resource_group_id        = each.value.resource_group_id
  security_ips             = each.value.security_ips
  vswitch_id               = each.value.vswitch_id
  zone_id                  = each.value.zone_id
  vpc_id                   = each.value.vpc_id
  disk_encryption          = each.value.disk_encryption
  disk_performance_level   = each.value.disk_performance_level
  kms_id                   = each.value.disk_encryption == true ? each.value.kms_id : null
  enable_ssl               = each.value.enable_ssl
  kernel_version           = each.value.kernel_version
}

resource "alicloud_adb_account" "this" {
  for_each               = { for cluster in var.db_clusters : cluster.mode => cluster if contains(keys(cluster), "accounts") && cluster.accounts != null }
  account_name           = lookup(each.value, "account_name")
  db_cluster_id          = alicloud_adb_db_cluster.this[each.key].id
  account_description    = lookup(each.value, "account_description")
  account_password       = lookup(each.value, "account_password")
  account_type           = lookup(each.value, "account_type")
  kms_encrypted_password = lookup(each.value, "kms_encrypted_password")
  kms_encryption_context = lookup(each.value, "kms_encrypted_password") != null ? lookup(each.value, "kms_encryption_context") : null
}

resource "alicloud_adb_backup_policy" "this" {
  for_each                = { for cluster in var.db_clusters : cluster.mode => cluster if contains(keys(cluster), "backup_policies") && cluster.backup_policies != null }
  db_cluster_id           = alicloud_adb_db_cluster.this[each.key].id
  preferred_backup_period = lookup(each.value, "preferred_backup_period")
  preferred_backup_time   = lookup(each.value, "preferred_backup_time")
}

resource "alicloud_adb_connection" "this" {
  for_each          = { for cluster in var.db_clusters : cluster.mode => cluster if contains(keys(cluster), "connections") && cluster.connections != null }
  db_cluster_id     = alicloud_adb_db_cluster.this[each.key].id
  connection_prefix = lookup(each.value, "connection_prefix")
}

resource "alicloud_adb_resource_group" "this" {
  for_each      = { for cluster in var.db_clusters : cluster.mode => cluster if contains(keys(cluster), "resource_groups") && cluster.resource_groups != null }
  db_cluster_id = alicloud_adb_db_cluster.this[each.key].id
  group_name    = lookup(each.value, "group_name")
  group_type    = lookup(each.value, "group_type")
  node_num      = lookup(each.value, "node_num")
  users         = lookup(each.value, "users")
}

resource "alicloud_adb_db_cluster_lake_version" "this" {
  for_each           = { for cluster in var.db_cluster_lake_versions : cluster.db_cluster_version => cluster }
  compute_resource   = each.value.compute_resource
  db_cluster_version = each.value.db_cluster_version
  payment_type       = each.value.payment_type
  storage_resource   = each.value.storage_resource
  vpc_id             = each.value.vpc_id
  vswitch_id         = each.value.vswitch_id
  zone_id            = each.value.zone_id

}

resource "alicloud_adb_lake_account" "this" {
  for_each         = { for cluster in var.db_cluster_lake_versions : cluster.db_cluster_version => cluster if contains(keys(cluster), "lake_account") && cluster.lake_account != null }
  account_name     = lookup(each.value, "account_name")
  account_password = lookup(each.value, "account_password")
  db_cluster_id    = alicloud_adb_db_cluster_lake_version.this[each.key].id
}