terraform {
  required_version = ">= 1.6.0"

  backend "gcs" {
    bucket = "terraform-state-school"
    prefix = "terraform/state"
  }
}
