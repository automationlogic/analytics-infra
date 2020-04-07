resource "google_cloud_scheduler_job" "ingest_clnn" {
  name        = "ingest-clnn"
  project     = var.analytics_project
  region      = var.region
  description = "ingest clnn daily news"
  schedule    = "0 8 * * *"
  time_zone   = "Europe/London"

  http_target {
    http_method = "GET"
    uri         = "https://ingest-clnn-news-dot-${var.analytics_project}.appspot.com/ingest"
  }

  depends_on = [google_project_service.analytics_infra]
}

resource "google_cloud_scheduler_job" "generate_climate_news" {
  name        = "generate-climate-news"
  project     = var.analytics_project
  region      = var.region
  description = "generate daily climate news"
  schedule    = "0 9 * * *"
  time_zone   = "Europe/London"

  http_target {
    http_method = "POST"
    uri         = "https://cloudbuild.googleapis.com/v1/projects/${var.analytics_project}/triggers/BUILD-generate-climate-news:run"
    body        = base64encode("{\"branchName\":\"master\"}")

    oauth_token {
      service_account_email = "${var.analytics_project}@appspot.gserviceaccount.com"
    }
  }

  depends_on = [google_project_service.analytics_infra]
}
