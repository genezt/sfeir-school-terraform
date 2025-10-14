# Create a VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "implicit-deps-vpc"
  auto_create_subnetworks = false # We'll create a subnet explicitly
  routing_mode            = "GLOBAL"
}

# Create a Subnet that depends on the VPC Network
# The 'network' argument automatically creates an implicit dependency
resource "google_compute_subnetwork" "example_subnet" {
  name          = "implicit-deps-sb"
  ip_cidr_range = "10.10.2.0/24"
  region        = "europe-west1"

  # IMPLICIT DEPENDENCY:
  # This line establishes a dependency: the subnet must wait for the VPC
  # to be created first because it references the VPC's self_link.
  network = google_compute_network.vpc_network.self_link
}

# 5. Output the Subnet's ID
output "subnet_id" {
  description = "The self_link of the created subnetwork"
  value       = google_compute_subnetwork.example_subnet.self_link
}
