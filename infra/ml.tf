# This is for prepping some infra for kubeflow in advanced
# Kubeflow only gets installed after terraform has run

resource "google_storage_bucket" "ml_models_bucket" {
  name               = format("%s-models", google_project.analytics_infra.project_id)
  project            = var.analytics_project
  location           = "EU"
  bucket_policy_only = true

  depends_on = [google_project_service.analytics_infra]
}

resource "google_storage_bucket" "ml_articles_bucket" {
  name               = format("%s-generated-articles", google_project.analytics_infra.project_id)
  project            = var.analytics_project
  location           = "EU"
  bucket_policy_only = true

  depends_on = [google_project_service.analytics_infra]
}
