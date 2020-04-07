resource "google_pubsub_topic" "analytics_infra" {
  for_each = var.topics
  name     = each.value
  project  = var.analytics_project

  depends_on = [google_project_service.analytics_infra]
}

resource "google_pubsub_subscription" "analytics_infra" {
  for_each = var.subscriptions
  name     = each.value
  project  = var.analytics_project
  topic    = google_pubsub_topic.analytics_infra[each.key].name

  depends_on = [google_pubsub_topic.analytics_infra]
}

resource "google_bigquery_dataset" "analytics_infra" {
  for_each      = var.datasets
  dataset_id    = each.value
  friendly_name = each.value
  project       = var.analytics_project
  location      = "EU"

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = var.owner_email
  }

  access {
    role          = "WRITER"
    user_by_email = "${google_project.analytics_infra.number}@cloudbuild.gserviceaccount.com"
  }

  depends_on = [google_project_service.analytics_infra]
}
