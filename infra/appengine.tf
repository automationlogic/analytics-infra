resource "google_app_engine_application" "app" {
  project     = google_project.analytics_infra.project_id
  location_id = var.region
}
