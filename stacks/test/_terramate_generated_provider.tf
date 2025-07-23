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
    container_name       = "sapcp-osaas-b8c39866-3cdb-4448-9128-7a7e85102e66-zrs"
    key                  = "e33fa601-cf67-41d4-96da-44622337e308.btptm.terraform.state"
    storage_account_name = "sapcpnjc8cwjshgjsjfsswtl"
  }
}
provider "btp" {
  globalaccount = var.globalaccount
}
