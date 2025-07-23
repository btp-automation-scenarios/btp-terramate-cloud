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
        storage_account_name = "sapcpnjc8cwjshgjsjfsswtl"
        container_name       = "sapcp-osaas-b8c39866-3cdb-4448-9128-7a7e85102e66-zrs"
        key                  = "${terramate.stack.id}.btptm.terraform.state"

      }
    }
    provider "btp" {
      globalaccount = var.globalaccount
    }
  }
}
