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
    key                  = "29300b60-f0bb-4dda-bb4a-f0320148b0ed.btptm.terraform.state"
    storage_account_name = "sapcpnjc8cwjshgjsjfsswtl"
  }
}
provider "btp" {
  globalaccount = var.globalaccount
}
