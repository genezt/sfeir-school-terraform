# Storage
resource "google_storage_bucket" "storage_example" {
  name          = "sfeir-sxb-tf-state-251015-0"
  location      = "EU"
  force_destroy = true  # Allows deletion of non-empty buckets
}

# VM
resource "google_compute_instance" "default" {
  name         = "state-vm"
  machine_type = "n2-standard-2"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "541132600523-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
