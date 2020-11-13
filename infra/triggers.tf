resource "google_cloudbuild_trigger" "analytics_infra" {
  provider = google-beta
  for_each = var.repos

  github {
    owner = var.owner
    name  = each.value
    push {
      branch = "^master|main$"
    }
  }

  substitutions = {
    _REGION                = var.region
    _ORCHESTRATION_PROJECT = var.orchestration_project_id
    _ANALYTICS_PROJECT     = var.analytics_project
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]
  ignored_files = [
    "README.md",
    "LICENSE",
    ".gitignore"
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
      branch = "^master|main$"
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
  ignored_files = [
    "README.md",
    "LICENSE",
    ".gitignore"
  ]

  depends_on = [google_project_service.analytics_infra]
}

# security repos have additional substitutions like org_id

resource "google_cloudbuild_trigger" "analytics_security" {
  provider = google-beta
  for_each = var.security_repos

  github {
    owner = var.owner
    name  = each.value
    push {
      branch = "^master|main$"
    }
  }

  substitutions = {
    _ORG_ID                       = var.org_id
    _REGION                       = var.region
    _ORCHESTRATION_PROJECT_NUMBER = var.orchestration_project_number
    _ANALYTICS_PROJECT_NUMBER     = google_project.analytics_infra.number
    _ANALYTICS_PROJECT            = var.analytics_project
    _BOOTSTRAP_IP                 = var.bootstrap_ip
    _BOOTSTRAP_USER               = var.owner_email
  }

  description = "BUILD: ${each.value}"
  filename    = "cloudbuild.yaml"
  included_files = [
    "**/*"
  ]
  ignored_files = [
    "README.md",
    "LICENSE",
    ".gitignore"
  ]

  depends_on = [google_project_service.analytics_infra]
}
