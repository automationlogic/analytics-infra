resource "google_cloudbuild_trigger" "analytics_infra" {
  for_each = var.repos
  project  = var.analytics_project

  trigger_template {
    branch_name = "master"
    repo_name   = each.value
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
