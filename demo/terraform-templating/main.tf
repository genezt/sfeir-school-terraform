resource "google_sql_database" "database" {
  for_each = var.databases
  name      = each.key
  instance  = var.instance_name
  project   = var.project_id
  charset   = each.value.charset
  collation = each.value.collation
}
