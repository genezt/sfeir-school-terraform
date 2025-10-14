resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "my_storage_bucket" {
  name          = "${var.bucket_name}-${random_id.db_name_suffix.hex}"
  location      = "EU"
  force_destroy = true  # Allows deletion of non-empty buckets
}
