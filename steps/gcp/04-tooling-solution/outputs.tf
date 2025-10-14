output "bucket_name" {
  value = google_storage_bucket.my_storage_bucket.name
  description = "The name of our bucket"
}
