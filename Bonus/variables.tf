variable "project_id" {
  description = "Google Cloud Platform (GCP) Project ID."
  type        = string
}

variable "region" {
  description = "GCP region name."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone name."
  type        = string
  default     = "us-central1-a"
}

variable "name" {
  description = "MySQL Server"
  type        = string
  default     = "mysql-server"
}

variable "machine_type" {
  description = "GCP VM instance machine type."
  type        = string
  default     = "c2-standard-8"
}

variable "labels" {
  description = "List of labels to attach to the VM instance."
  type        = map
}
