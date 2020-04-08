resource "google_cloudbuild_trigger" "analytics_infra" {
  provider = google-beta
  for_each = var.repos

  github {
    owner = var.owner
    name  = each.value
    push {
      branch = "^master$"
    }
  }

  substitutions = {
    _REGION            = var.region
    _ANALYTICS_PROJECT = var.analytics_project
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
