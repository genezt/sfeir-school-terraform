variable "project_id" {
  type        = string
  description = "Id of the google project"
}

variable "region" {
  type        = string
  description = "Region for GCP resources"
  default     = "europe-west9"
}

variable "gcp_service_list" {
  type        = list(string)
  description = "List of GCP service APIs to enable"
}

variable "custom_role_permissions" {
  type        = list(string)
  description = "List of permissions for the custom SFEIR School role"
}

variable "service_account_roles" {
  type        = list(string)
  description = "List of IAM roles to assign to the service account"
}
