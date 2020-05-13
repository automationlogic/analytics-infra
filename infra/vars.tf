variable "org_id" {}
variable "region" {}
variable "orchestration_project_id" {}
variable "orchestration_project_number" {}
variable "analytics_project" {}
variable "billing_account" {}
variable "owner" {}
variable "owner_email" {}
variable "kubeflow_host" {}
variable "bootstrap_ip" {}

variable "repos" {
  type = set(string)
}
variable "training_repos" {
  type = set(string)
}
variable "security_repos" {
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
