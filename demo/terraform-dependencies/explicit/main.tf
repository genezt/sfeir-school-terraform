# Storage
resource "google_storage_bucket" "storage_example" {
  name          = "sfeir-sxb-terraform-school-251015"
  location      = "EU"
  force_destroy = true  # Allows deletion of non-empty buckets
}

resource "google_storage_bucket_object" "example_file" {
  name   = "hello.txt"
  bucket = google_storage_bucket.storage_example.name
  content = "Hello SFEIR School !"
}

# VM
resource "google_compute_instance" "default" {
  name         = "explicit-deps-vm"
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

  metadata_startup_script = "gcloud storage cp gs://sfeir-sxb-terraform-school-251015/hello.txt /root/"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "541132600523-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  depends_on = [ google_storage_bucket_object.example_file ]
}
