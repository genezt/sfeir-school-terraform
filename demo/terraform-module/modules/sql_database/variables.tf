variable "google_sql_database_instance" {
  description = "CloudSQL instance in which the database will be created"
  type        = object({
    name = string
  })
}
