variables {
  prefix = "test"
}

run "valid_string_concat" {
  command = plan

  assert {
    condition     = google_storage_bucket.bucket.name == "test-bucket"
    error_message = "GCS bucket name did not match expected"
  }

  assert {
    condition = length(google_storage_bucket.bucket.name) > 5
    error_message = "Minimun size bucket name"
  }

  assert {
    condition = length(google_storage_bucket.bucket.name) < 15
    error_message = "Maximun size bucket name"
  }

}

run "vpc_and_subnets_validation" {
  command = plan

  assert {
    condition     = google_compute_network.vpc.name == "test-vpc"
    error_message = "VPC name did not match expected"
  }

  assert {
    condition     = google_compute_network.vpc.auto_create_subnetworks == false
    error_message = "VPC should have auto_create_subnetworks disabled"
  }

  assert {
    condition     = length(google_compute_subnetwork.subnets) == 3
    error_message = "Expected exactly 3 subnets to be created"
  }

  # Validate first subnet CIDR is 10.0.0.0/24
  assert {
    condition     = google_compute_subnetwork.subnets[0].ip_cidr_range == "10.0.0.0/24"
    error_message = "Subnet 0 CIDR should be 10.0.0.0/24, got ${google_compute_subnetwork.subnets[0].ip_cidr_range}"
  }

  # Validate second subnet CIDR is 10.0.1.0/24
  assert {
    condition     = google_compute_subnetwork.subnets[1].ip_cidr_range == "10.0.1.0/24"
    error_message = "Subnet 1 CIDR should be 10.0.1.0/24, got ${google_compute_subnetwork.subnets[1].ip_cidr_range}"
  }

  # Validate third subnet CIDR is 10.0.2.0/24
  assert {
    condition     = google_compute_subnetwork.subnets[2].ip_cidr_range == "10.0.2.0/24"
    error_message = "Subnet 2 CIDR should be 10.0.2.0/24, got ${google_compute_subnetwork.subnets[2].ip_cidr_range}"
  }

  # Validate all subnets have /24 CIDR blocks
  assert {
    condition     = alltrue([
      for subnet in google_compute_subnetwork.subnets :
      can(regex("/24$", subnet.ip_cidr_range))
    ])
    error_message = "All subnets must have /24 CIDR blocks"
  }

  # Validate all subnets are in the 10.0.x.0/24 range
  assert {
    condition     = alltrue([
      for subnet in google_compute_subnetwork.subnets :
      can(regex("^10\\.0\\.[0-9]+\\.0/24$", subnet.ip_cidr_range))
    ])
    error_message = "All subnets must be in the 10.0.x.0/24 range"
  }

  # Validate subnet names
  assert {
    condition     = alltrue([
      for idx, subnet in google_compute_subnetwork.subnets :
      subnet.name == "test-subnet-${idx}"
    ])
    error_message = "Subnet names should follow the pattern test-subnet-{index}"
  }
}
