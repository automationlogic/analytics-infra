resource "google_app_engine_application" "app" {
  project     = google_project.analytics_infra.project_id
  location_id = var.region

  depends_on = [google_project_service.analytics_infra]
}
