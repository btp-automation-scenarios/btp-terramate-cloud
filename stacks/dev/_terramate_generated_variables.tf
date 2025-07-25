// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

variable "globalaccount" {
  description = "The globalaccount subdomain where the sub account shall be created."
  type        = string
}
variable "region" {
  default     = "us10"
  description = "The region where the account shall be created in."
  type        = string
}
variable "unit" {
  default     = "Sales"
  description = "Defines to which organisation the sub account shall belong to."
  type        = string
}
variable "unit_shortname" {
  default     = "sls"
  description = "Short name for the organisation the sub account shall belong to."
  type        = string
}
variable "architect" {
  default     = "genius.architect@test.com"
  description = "Defines the email address of the architect for the subaccount"
  type        = string
}
variable "costcenter" {
  default     = "1234509874"
  description = "Defines the costcenter for the subaccount"
  type        = string
}
variable "owner" {
  default     = "someowner@test.com"
  description = "Defines the owner of the subaccount"
  type        = string
}
variable "team" {
  default     = "awesome_dev_team@test.com"
  description = "Defines the team of the sub account"
  type        = string
}
variable "emergency_admins" {
  default = [
    "somearchitect@test.com",
  ]
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
  type        = list(string)
}
variable "entitlements" {
  default = [
    {
      amount = null
      group  = "Audit + Application Log"
      name   = "auditlog-viewer"
      plan   = "free"
      type   = "service"
    },
    {
      amount = null
      group  = "Alert"
      name   = "alert-notification"
      plan   = "standard"
      type   = "service"
    },
    {
      amount = null
      group  = "SAP HANA Cloud"
      name   = "hana-cloud"
      plan   = "hana-free"
      type   = "service"
    },
    {
      amount = null
      group  = "SAP HANA Cloud"
      name   = "hana"
      plan   = "hdi-shared"
      type   = "service"
    },
  ]
  description = "List of entitlements for a BTP subaccount"
  type = list(object({
    group  = string
    type   = string
    name   = string
    plan   = string
    amount = number
  }))
}
