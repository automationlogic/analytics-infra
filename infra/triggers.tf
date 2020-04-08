# Normal triggers

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

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}

# Kubeflow deployment trigger

resource "google_cloudbuild_trigger" "analytics_kubeflow" {
  provider = google-beta

  github {
    owner = "thundercomb"
    name  = var.kf_repo
    push {
      branch = "^master$"
    }
  }

  substitutions = {
    _ANALYTICS_PROJECT   = var.analytics_project
    _REGION              = var.region
    _GKE_CLUSTER_NAME    = google_container_cluster.primary.name
    _OAUTH_CLIENT_ID     = var.oauth_client_id
    _OAUTH_CLIENT_SECRET = var.oauth_client_secret
  }

  description = "BUILD: Kubeflow"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]

  depends_on = [google_project_service.analytics_infra]
}
