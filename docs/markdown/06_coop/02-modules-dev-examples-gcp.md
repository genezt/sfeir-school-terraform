<!-- .slide: class="with-code-bg-dark"-->

# Modules

## Structure du dossier

```
terraform-module/
├── modules/
│   ├── sql_database/
│   │   ├── main.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── sql_instance/
│       ├── main.tf
│       ├── output.tf
│       └── variables.tf
└── main.tf
```

##==##

<!-- .slide: class="with-code-bg-dark"-->

# Modules

## Dans l'instance module

```hcl-terraform
resource "google_sql_database_instance" "instance" {
  name             = "my_postgresql_instance"
  database_version = "POSTGRES_14"
  settings {
    tier            = "db-custom-1-3840"
    disk_autoresize = "true"
    disk_type       = "PD_SSD"
  }
}

output "google_sql_database_instance" {
  value = google_sql_database_instance.instance
}
```


##==##

<!-- .slide: class="with-code-bg-dark"-->

# Modules

## Dans le database module

```hcl-terraform
variable "google_sql_database_instance" {
  description = "CloudSQL instance in which the database will be created"
  type        = object({
    name = string
  })
}

resource "google_sql_database" "database" {
  name     = "my_database"
  instance = var.google_sql_database_instance.name
}

output "google_sql_database" {
  value = google_sql_database.database
}

```


##==##

<!-- .slide: class="with-code-bg-dark"-->

# Modules

## Dans le projet terraform appelant

```hcl-terraform
module "instance" {
  source = "./sql_instance"
}

module "database" {
  source                       = "./sql_database"
  google_sql_database_instance = module.instance.google_sql_database_instance
}
```
