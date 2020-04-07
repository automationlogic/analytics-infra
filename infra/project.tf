resource "google_project" "analytics_infra" {
  name            = var.analytics_project
  org_id          = var.org_id
  project_id      = var.analytics_project
  billing_account = var.billing_account
}

resource "google_project_service" "analytics_infra" {
  project = var.analytics_project
  for_each = toset([
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "appengine.googleapis.com",
    "pubsub.googleapis.com",
    "sourcerepo.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudscheduler.googleapis.com",
    "containerregistry.googleapis.com",
    "storage-api.googleapis.com",
    "bigquerystorage.googleapis.com",
    "container.googleapis.com",
    "compute.googleapis.com",
    "oslogin.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com"
  ])
  service = each.key

  depends_on = [google_project.analytics_infra]
}
