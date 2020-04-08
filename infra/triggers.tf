resource "google_cloudbuild_trigger" "analytics_infra" {
  for_each = var.repos

  github {
    owner = "thundercomb"
    name  = each.value
    push {
      branch = "^master$"
    }
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
