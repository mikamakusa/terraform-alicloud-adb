## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.253.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.255.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_adb_account.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_account) | resource |
| [alicloud_adb_backup_policy.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_backup_policy) | resource |
| [alicloud_adb_connection.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_connection) | resource |
| [alicloud_adb_db_cluster.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_db_cluster) | resource |
| [alicloud_adb_db_cluster_lake_version.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_db_cluster_lake_version) | resource |
| [alicloud_adb_lake_account.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_lake_account) | resource |
| [alicloud_adb_resource_group.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/adb_resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_privilege"></a> [account\_privilege](#input\_account\_privilege) | n/a | <pre>list(object({<br/>    privilege_type            = optional(string)<br/>    privileges                = optional(set(string))<br/>    privilege_object_table    = optional(string)<br/>    privilege_object_column   = optional(string)<br/>    privilege_object_database = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_db_cluster_lake_versions"></a> [db\_cluster\_lake\_versions](#input\_db\_cluster\_lake\_versions) | n/a | <pre>list(object({<br/>    compute_resource              = string<br/>    db_cluster_version            = string<br/>    payment_type                  = string<br/>    storage_resource              = string<br/>    vpc_id                        = string<br/>    vswitch_id                    = string<br/>    zone_id                       = string<br/>    security_ips                  = optional(string)<br/>    secondary_vswitch_id          = optional(string)<br/>    secondary_zone_id             = optional(string)<br/>    product_form                  = optional(string)<br/>    product_version               = optional(string)<br/>    reserved_node_count           = optional(string)<br/>    disk_encryption               = optional(bool)<br/>    kms_id                        = optional(string)<br/>    enable_ssl                    = optional(bool)<br/>    db_cluster_description        = optional(string)<br/>    resource_group_id             = optional(string)<br/>    period                        = optional(number)<br/>    enable_default_resource_group = optional(string)<br/>    source_db_cluster_id          = optional(string)<br/>    backup_set_id                 = optional(string)<br/>    restore_type                  = optional(string)<br/>    restore_to_time               = optional(string)<br/>    lake_account = optional(list(object({<br/>      account_name        = string<br/>      account_password    = string<br/>      account_description = optional(string)<br/>      account_type        = optional(string)<br/>    })))<br/>  }))</pre> | `[]` | no |
| <a name="input_db_clusters"></a> [db\_clusters](#input\_db\_clusters) | n/a | <pre>list(object({<br/>    db_cluster_category      = string<br/>    mode                     = string<br/>    auto_renew_period        = optional(number)<br/>    compute_resource         = optional(string)<br/>    db_node_class            = optional(string)<br/>    db_node_count            = optional(number)<br/>    db_node_storage          = optional(number)<br/>    description              = optional(string)<br/>    elastic_io_resource      = optional(number)<br/>    elastic_io_resource_size = optional(string)<br/>    maintain_time            = optional(string)<br/>    modify_type              = optional(string)<br/>    payment_type             = optional(string)<br/>    period                   = optional(number)<br/>    renewal_status           = optional(string)<br/>    resource_group_id        = optional(string)<br/>    security_ips             = optional(set(string))<br/>    vswitch_id               = optional(string)<br/>    zone_id                  = optional(string)<br/>    vpc_id                   = optional(string)<br/>    disk_encryption          = optional(bool)<br/>    disk_performance_level   = optional(string)<br/>    kms_id                   = optional(string)<br/>    enable_ssl               = optional(bool)<br/>    kernel_version           = optional(number)<br/>    db_cluster_version       = optional(string)<br/>    accounts = optional(list(object({<br/>      account_name           = string<br/>      account_description    = optional(string)<br/>      account_password       = optional(string)<br/>      account_type           = optional(string)<br/>      kms_encrypted_password = optional(string)<br/>      kms_encryption_context = optional(map(string))<br/>    })))<br/>    backup_policies = optional(list(object({<br/>      preferred_backup_period = set(string)<br/>      preferred_backup_time   = string<br/>    })))<br/>    connections = optional(list(object({<br/>      connection_prefix = optional(string)<br/>    })))<br/>    resource_groups = optional(list(object({<br/>      group_name = string<br/>      group_type = optional(string)<br/>      node_num   = optional(number)<br/>      users      = optional(set(string))<br/>    })))<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | Informations relatives au comptes des cluster MysqlDB. |
| <a name="output_backup_policy"></a> [backup\_policy](#output\_backup\_policy) | Informations relatives à la politique liée au backup. |
| <a name="output_connection"></a> [connection](#output\_connection) | Informations de connection aux cluster mysqlDB. |
| <a name="output_db_cluster"></a> [db\_cluster](#output\_db\_cluster) | Informations relatives au cluster MysqlDB. |
| <a name="output_db_cluster_lake_version"></a> [db\_cluster\_lake\_version](#output\_db\_cluster\_lake\_version) | n/a |
| <a name="output_lake_account"></a> [lake\_account](#output\_lake\_account) | n/a |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | n/a |
