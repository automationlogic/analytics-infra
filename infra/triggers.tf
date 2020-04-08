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

# training repos have additional substitutions for kubeflow

resource "google_cloudbuild_trigger" "analytics_training" {
  provider = google-beta
  for_each = var.training_repos

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
    _KUBEFLOW_HOST     = var.kubeflow_host
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
