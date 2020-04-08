resource "google_cloudbuild_trigger" "analytics_infra" {
  provider = google-beta
  for_each = var.repos

  github {
    owner = "thundercomb"
    name  = each.value
    push {
      branch = "^master$"
    }
  }

  substitutions = {
    _ANALYTICS_PROJECT = var.analytics_project
    _REGION            = var.region
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
