resource "google_storage_bucket" "bucket" {
  name     = "${var.bucket_prefix}-bucket"
  location = "US"
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
