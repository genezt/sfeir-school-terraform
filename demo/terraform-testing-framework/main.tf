resource "google_storage_bucket" "bucket" {
  name     = "${var.prefix}-bucket"
  location = "EU"
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

# VPC Network
resource "google_compute_network" "vpc" {
  name                    = "${var.prefix}-vpc"
  auto_create_subnetworks = false
}

# Subnets with /24 CIDR blocks
resource "google_compute_subnetwork" "subnets" {
  count         = 3
  name          = "${var.prefix}-subnet-${count.index}"
  ip_cidr_range = "10.0.${count.index}.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}
