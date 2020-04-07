# This is for prepping some infra for kubeflow in advanced
# Kubeflow only gets installed after terraform has run

resource "google_storage_bucket" "kubeflow_pipeline_bucket" {
  name               = "kubeflow-pipeline"
  project            = var.analytics_project
  location           = "EU"
  bucket_policy_only = true
}

# The firewall rules are for Kubeflow Istio, which is setup later
# If the ports change, this will need changing too

resource "google_compute_firewall" "http_istio_ingress" {
  name    = "allow-gateway-http"
  network = "default"
  project = var.analytics_project

  allow {
    protocol = "tcp"
    ports    = ["31380"]
  }
}

resource "google_compute_firewall" "https_istio_ingress" {
  name    = "allow-gateway-https"
  network = "default"
  project = var.analytics_project

  allow {
    protocol = "tcp"
    ports    = ["31390"]
  }
}
