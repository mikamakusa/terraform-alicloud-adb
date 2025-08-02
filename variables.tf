variable "db_clusters" {
  type = list(object({
    db_cluster_category      = string
    mode                     = string
    auto_renew_period        = optional(number)
    compute_resource         = optional(string)
    db_node_class            = optional(string)
    db_node_count            = optional(number)
    db_node_storage          = optional(number)
    description              = optional(string)
    elastic_io_resource      = optional(number)
    elastic_io_resource_size = optional(string)
    maintain_time            = optional(string)
    modify_type              = optional(string)
    payment_type             = optional(string)
    period                   = optional(number)
    renewal_status           = optional(string)
    resource_group_id        = optional(string)
    security_ips             = optional(set(string))
    vswitch_id               = optional(string)
    zone_id                  = optional(string)
    vpc_id                   = optional(string)
    disk_encryption          = optional(bool)
    disk_performance_level   = optional(string)
    kms_id                   = optional(string)
    enable_ssl               = optional(bool)
    kernel_version           = optional(number)
    db_cluster_version       = optional(string)
    accounts = optional(list(object({
      account_name           = string
      account_description    = optional(string)
      account_password       = optional(string)
      account_type           = optional(string)
      kms_encrypted_password = optional(string)
      kms_encryption_context = optional(map(string))
    })))
    backup_policies = optional(list(object({
      preferred_backup_period = set(string)
      preferred_backup_time   = string
    })))
    connections = optional(list(object({
      connection_prefix = optional(string)
    })))
    resource_groups = optional(list(object({
      group_name = string
      group_type = optional(string)
      node_num   = optional(number)
      users      = optional(set(string))
    })))
  }))
  default = []

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if cluster.auto_renew_period != null && contains(["1", "2", "3", "6", "12", "24", "36"], cluster.auto_renew_period)])
    error_message = "Valid values are : 1, 2, 3, 6, 12, 24, 36."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if contains(["Basic", "Cluster", "MixedStorage"], cluster.db_cluster_category)])
    error_message = "Valid values are : Basic, Cluster, MixedStorage."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if contains(["reserver", "flexible"], cluster.mode)])
    error_message = "Valid values are : reserver, flexible."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if cluster.payment_type != null && contains(["PayAsYouGo", "Subscription"], cluster.payment_type)])
    error_message = "Valid values are : PayAsYouGo and Subscription."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if cluster.renewal_status != null && contains(["AutoRenewal", "Normal", "NotRenewal"], cluster.renewal_status)])
    error_message = "Valid values are : AutoRenewal, Normal, NotRenewal."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if cluster.elastic_io_resource_size != null && contains(["8Core64GB", "12Core96GB", "16Core128GB"], cluster.elastic_io_resource_size)])
    error_message = "Valid values are : 8Core64GB, 12Core96GB, 16Core128GB."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters : true if cluster.disk_performance_level != null && contains(["PL1", "PL2", "PL3"], cluster.disk_performance_level)])
    error_message = "Valid values are : PL1, PL2, PL3."
  }

  validation {
    condition     = alltrue([for cluster in var.db_clusters.*.accounts : true if cluster[0].account_type != null && contains(["Normal", "Super"], cluster[0].account_type)])
    error_message = "Valid values are : Normal, Super."
  }
}

variable "db_cluster_lake_versions" {
  type = list(object({
    compute_resource   = string
    db_cluster_version = string
    payment_type       = string
    storage_resource   = string
    vpc_id             = string
    vswitch_id         = string
    zone_id            = string
    lake_account = optional(list(object({
      account_name     = string
      account_password = string
    })))
  }))
  default = []
}