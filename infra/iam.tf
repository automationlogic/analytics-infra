# Editors: gcr, app engine, cloud services

resource "google_project_iam_binding" "editors" {
  project = var.analytics_project
  role    = "roles/editor"

  members = [
    "serviceAccount:service-${google_project.analytics_infra.number}@containerregistry.iam.gserviceaccount.com",
    "serviceAccount:${google_project.analytics_infra.project_id}@appspot.gserviceaccount.com",
    "serviceAccount:${google_project.analytics_infra.number}@cloudservices.gserviceaccount.com",
  ]

  depends_on = [google_project_service.analytics_infra,
  google_app_engine_application.app]
}

# Cloud Build

resource "google_project_iam_binding" "cloud_build_app_engine" {
  project = var.analytics_project
  role    = "roles/appengine.appAdmin"

  members = [
    "serviceAccount:${google_project.analytics_infra.number}@cloudbuild.gserviceaccount.com"
  ]

  depends_on = [google_project_service.analytics_infra]
}

# App Engine

resource "google_project_iam_binding" "app_engine_bigquery" {
  project = var.analytics_project
  role    = "roles/bigquery.dataEditor"

  members = [
    "serviceAccount:${google_project.analytics_infra.project_id}@appspot.gserviceaccount.com"
  ]

  depends_on = [google_project_service.analytics_infra,
  google_app_engine_application.app]
}

# Kubeflow

resource "google_project_iam_binding" "gke_kubeflow_jupyter_storage" {
  project = var.analytics_project
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:${google_project.analytics_infra.number}-compute@developer.gserviceaccount.com"
  ]

  depends_on = [
    google_project_service.analytics_infra,
    google_container_cluster.primary
  ]
}


resource "google_project_iam_binding" "gke_kubeflow_jupyter_bigquery" {
  project = var.analytics_project
  role    = "roles/bigquery.admin"

  members = [
    "serviceAccount:${google_project.analytics_infra.number}-compute@developer.gserviceaccount.com"
  ]

  depends_on = [
    google_project_service.analytics_infra,
    google_container_cluster.primary
  ]
}
