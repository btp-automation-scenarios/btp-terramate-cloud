// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = ">= 1.12.0"
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.15.0"
    }
  }
  backend "azurerm" {
    container_name       = "terraformstate"
    key                  = "131616f9-fd80-41a9-a1e9-10b5e43d3058.btptm.terraform.state"
    resource_group_name  = "TerraformStateStore"
    storage_account_name = "terraformstate300477"
  }
}
provider "btp" {
  globalaccount = var.globalaccount
}
