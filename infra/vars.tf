variable "org_id" {}
variable "region" {}
variable "repos" {
  type = set(string)
}
variable "topics" {
  type = set(string)
}
variable "subscriptions" {
  type = set(string)
}
variable "datasets" {
  type = set(string)
}
variable "analytics_project" {}
variable "billing_account" {}
variable "owner_email" {}
variable "oauth_client_id" {}
variable "oauth_client_secret" {}
