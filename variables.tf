variable "project" {
  description = "Project ID where cluster will be placed"
  default     = "augustynyrst"
}

variable "name" {
  description = "Clusters name"
  default     = "alcluster"
}

variable "location" {
  description = "Location of your cluster"
  default     = "europe-west2-b"
}

variable "machine_type" {
  description = "VM types for cluster"
  default     = "n1-standard-2"
}

variable "nodename" {
  description = "name of nodes"
  default     = "name-node"
}
