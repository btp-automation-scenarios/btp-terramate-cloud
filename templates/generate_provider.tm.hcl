generate_hcl "_terramate_generated_provider.tf" {
  content {
    terraform {
      required_version = tm_ternary(tm_contains(terramate.stack.tags, "dev"), global.terraform.version_dev, global.terraform.version)

      required_providers {
        btp = {
          source  = "SAP/btp"
          version = tm_ternary(tm_contains(terramate.stack.tags, "dev"), global.terraform.providers.btp.version_dev, global.terraform.providers.btp.version)
        }
      }
      backend "azurerm" {
        # Using Object Storage on SAP BTP - Only SAS Token is available
        sas_token            = var.sas_token
        storage_account_name = var.account_name
        container_name       = var.container_name
        key                  = "${terramate.stack.id}.btptm.terraform.state"

      }
    }
    provider "btp" {
      globalaccount = var.globalaccount
    }
  }
}
