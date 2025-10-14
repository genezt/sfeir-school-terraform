project_id = "school-terraform-oct25-sbx"
region     = "europe-west9"
instance_name = "demo-database"
databases = {
  "db_1": {
    charset     = "utf8"
    collation   = "utf8_unicode_ci"
    user        = "root"
  }
  "db_2": {
    charset     = "latin1"
    collation   = "latin1_swedish_ci"
    user        = "my_app"
  }
}
