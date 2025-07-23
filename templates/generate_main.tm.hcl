generate_hcl "_terramate_generated_main.tf" {

  lets {
    stage = tm_upper(tm_element(terramate.stack.tags, 0))
    usage = tm_ternary(tm_contains(terramate.stack.tags, "dev"), "NOT_USED_FOR_PRODUCTION", "USED_FOR_PRODUCTION")
  }

  content {

    locals {
      project_subaccount_name = "${var.unit_shortname}_${let.stage}"
      # Remove all blanks and substitute all "_" with a "-"
      project_subaccount_domain = replace(lower(replace("${local.project_subaccount_name}", "_", "-")), " ", "")
      project_subaccount_cf_org = replace(join("", ["${var.unit}", "${local.project_subaccount_domain}"]), " ", "")
    }

    resource "btp_subaccount" "project" {
      name      = local.project_subaccount_name
      subdomain = local.project_subaccount_domain
      region    = lower(var.region)
      labels = {
        "architect" : ["${var.architect}"]
        "costcenter" : ["${var.costcenter}"],
        "owner" : ["${var.owner}"],
        "team" : ["${var.team}"]
      }
      usage = let.usage

    }

    resource "btp_subaccount_role_collection_assignment" "subaccount_users" {
      for_each             = toset("${var.emergency_admins}")
      subaccount_id        = btp_subaccount.project.id
      role_collection_name = "Subaccount Administrator"
      user_name            = each.value
    }

    resource "btp_subaccount_entitlement" "entitlements" {

      for_each = {
        for index, entitlement in var.entitlements :
        index => entitlement
      }

      subaccount_id = btp_subaccount.project.id
      service_name  = each.value.name
      plan_name     = each.value.plan
    }

    resource "btp_subaccount_security_settings" "sec_setting" {
      subaccount_id = btp_subaccount.project.id


      access_token_validity  = 7200
      refresh_token_validity = 7200

      treat_users_with_same_email_as_same_user = true


      iframe_domains_list = ["https://www.sap.com", "https://www.help.sap.com"]
    }
  }
}
