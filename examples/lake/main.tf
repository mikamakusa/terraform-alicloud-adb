provider "alicloud" {}

data "alicloud_adb_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_adb_zones.default.ids.0
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "VPCID" {
  vpc_name = var.name

  cidr_block = "172.16.0.0/12"
}

variable "name" {
  default = "terraform-example"
}

variable "account_type" {
  type = string
}

variable "account_name" {
  type = string
}

variable "account_password" {
  type = string
}

module "lake" {
  source = "../../"
  db_cluster_lake_versions = [
    {
      db_cluster_version            = "5.0"
      vpc_id                        = data.alicloud_vpcs.default.ids.0
      vswitch_id                    = data.alicloud_vswitches.default.ids.0
      zone_id                       = data.alicloud_adb_zones.default.ids.0
      compute_resource              = "16ACU"
      storage_resource              = "0ACU"
      payment_type                  = "PayAsYouGo"
      enable_default_resource_group = false
      lake_account = [
        {
          account_type     = "Super"
          account_name     = "tfnormal"
          account_password = "normal@2023"
        }
      ]
    }
  ]
  account_privilege = [
    {
      privilege_type            = "Database"
      privilege_object_database = "MYSQL"
      privileges = [
        "select",
        "update"
      ]
    }
  ]
}