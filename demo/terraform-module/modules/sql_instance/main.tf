resource "google_sql_database_instance" "instance" {
  name             = "my_postgresql_instance"
  database_version = "POSTGRES_14"
  settings {
    tier            = "db-custom-1-3840"
    disk_autoresize = "true"
    disk_type       = "PD_SSD"
  }
}
