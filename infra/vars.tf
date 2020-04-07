variable "org_id" {}
variable "analytics_project" {}
variable "billing_account" {}
variable "owner_email" {}
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
