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
    container_name       = var.container_name
    key                  = "29300b60-f0bb-4dda-bb4a-f0320148b0ed.btptm.terraform.state"
    sas_token            = var.sas_token
    storage_account_name = var.account_name
  }
}
provider "btp" {
  globalaccount = var.globalaccount
}
