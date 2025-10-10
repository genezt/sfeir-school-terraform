module "instance" {
  source = "./modules/sql_instance"
}

module "database" {
  source                       = "./modules/sql_database"
  google_sql_database_instance = module.instance.google_sql_database_instance
}
