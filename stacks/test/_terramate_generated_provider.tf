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
    key                  = "e33fa601-cf67-41d4-96da-44622337e308.btptm.terraform.state"
    resource_group_name  = "TerraformStateStore"
    storage_account_name = "terraformstate300477"
  }
}
provider "btp" {
  globalaccount = var.globalaccount
}
