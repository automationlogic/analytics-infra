resource "google_project" "analytics_infra" {
  name            = var.analytics_project
  org_id          = var.org_id
  project_id      = var.analytics_project
  billing_account = var.billing_account
}

resource "google_project_service" "analytics_infra" {
  project = var.analytics_project
  for_each = toset([
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerystorage.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudscheduler.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "storage-api.googleapis.com",
  ])
  service = each.key

  depends_on = [google_project.analytics_infra]
}
