resource "google_storage_bucket" "storage_example" {
  name          = "sfeir-sxb-terraform-school-251015"
  location      = "EU"
  force_destroy = true  # Allows deletion of non-empty buckets
}
