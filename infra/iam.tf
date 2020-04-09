# App Engine

resource "google_project_iam_member" "app_engine" {
  project = var.analytics_project
  for_each = toset([
    "roles/editor",
    "roles/bigquery.dataEditor"
  ])

  role = each.key

  member = "serviceAccount:${google_project.analytics_infra.project_id}@appspot.gserviceaccount.com"

  depends_on = [
    google_project_service.analytics_infra,
    google_app_engine_application.app
  ]
}

# Container registry

resource "google_project_iam_member" "container_registry" {
  project = var.analytics_project
  for_each = toset([
    "roles/editor"
  ])

  role = each.key

  member = "serviceAccount:service-${google_project.analytics_infra.number}@containerregistry.iam.gserviceaccount.com"

  depends_on = [
    google_project_service.analytics_infra,
    google_app_engine_application.app
  ]
}

# Services

resource "google_project_iam_member" "services" {
  project = var.analytics_project
  for_each = toset([
    "roles/editor"
  ])

  role = each.key

  member = "serviceAccount:${google_project.analytics_infra.number}@cloudservices.gserviceaccount.com"

  depends_on = [
    google_project_service.analytics_infra,
    google_app_engine_application.app
  ]
}

# Cloud Build

resource "google_project_iam_member" "cloud_build" {
  project = var.analytics_project
  for_each = toset([
    "roles/appengine.appAdmin"
  ])
  role = each.key

  member = "serviceAccount:${google_project.analytics_infra.number}@cloudbuild.gserviceaccount.com"

  depends_on = [
    google_project_service.analytics_infra
  ]
}

# Kubeflow

resource "google_project_iam_member" "kubeflow" {
  project = var.analytics_project
  for_each = toset([
    "roles/storage.admin",
    "roles/bigquery.admin"
  ])
  role = each.key

  member = "serviceAccount:${google_project.analytics_infra.number}-compute@developer.gserviceaccount.com"

  depends_on = [
    google_project_service.analytics_infra,
  ]
}
