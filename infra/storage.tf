# Buckets to be used by other services

resource "google_storage_bucket" "ml_models_bucket" {
  name               = format("%s-models", google_project.analytics_infra.project_id)
  project            = var.analytics_project
  location           = "EU"
  bucket_policy_only = true

  depends_on = [google_project_service.analytics_infra]
}

resource "google_storage_bucket" "kubeflow_pipeline_bucket" {
  name               = format("%s-kubeflow-pipelines", google_project.analytics_infra.project_id)
  project            = var.analytics_project
  location           = "EU"
  bucket_policy_only = true

  depends_on = [google_project_service.analytics_infra]
}
