// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

locals {
  project_subaccount_cf_org = replace(join("", [
    "${var.unit}",
    "${local.project_subaccount_domain}",
  ]), " ", "")
  project_subaccount_domain = replace(lower(replace("${local.project_subaccount_name}", "_", "-")), " ", "")
  project_subaccount_name   = "${var.unit_shortname}_DEV"
}
resource "btp_subaccount" "project" {
  labels = {
    "architect" = [
      "${var.architect}",
    ]
    "costcenter" = [
      "${var.costcenter}",
    ]
    "owner" = [
      "${var.owner}",
    ]
    "team" = [
      "${var.team}",
    ]
  }
  name      = local.project_subaccount_name
  region    = lower(var.region)
  subdomain = local.project_subaccount_domain
  usage     = "NOT_USED_FOR_PRODUCTION"
}
resource "btp_subaccount_role_collection_assignment" "subaccount_users" {
  for_each             = toset("${var.emergency_admins}")
  role_collection_name = "Subaccount Administrator"
  subaccount_id        = btp_subaccount.project.id
  user_name            = each.value
}
resource "btp_subaccount_entitlement" "entitlements" {
  for_each      = { for index, entitlement in var.entitlements : index => entitlement }
  plan_name     = each.value.plan
  service_name  = each.value.name
  subaccount_id = btp_subaccount.project.id
}
resource "btp_subaccount_security_settings" "sec_setting" {
  access_token_validity                    = 7200
  iframe_domains_list                      = "[https://www.sap.com]"
  refresh_token_validity                   = 7200
  subaccount_id                            = btp_subaccount.project.id
  treat_users_with_same_email_as_same_user = true
}
