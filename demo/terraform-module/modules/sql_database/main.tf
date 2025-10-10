resource "google_sql_database" "database" {
  name     = "my_database"
  instance = var.google_sql_database_instance.name
}
