variables {
  bucket_prefix = "test"
}

run "valid_string_concat" {
  command = plan

  assert {
    condition     = google_storage_bucket.bucket.name == "test-bucket"
    error_message = "GCS bucket name did not match expected"
  }
}
