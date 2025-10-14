variable "project_id" {
  type        = string
  description = "Id of the google project"
}

variable "region" {
  type        = string
  description = "Region for GCP resources"
  default     = "europe-west9"
}

variable "databases" {
  type = map(
    object({
      charset   = string
      collation = string
    })
  )
}

variable "instance_name" {
  type = string
  description = "Instance SQL name"
}
