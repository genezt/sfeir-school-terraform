variable "project_id" {
  type        = string
  description = "Id of the google project"
}

variable "region" {
  type        = string
  description = "Region for GCP resources"
  default     = "europe-west9"
}

variable "prefix" {
  type = string
}
