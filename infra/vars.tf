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
variable "owner" {}
variable "owner_email" {}
variable "kubeflow_host" {}
