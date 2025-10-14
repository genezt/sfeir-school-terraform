# terraform dependencies implicit

Example of terraform implicit dependencies

## launch
```
terraform init
terraform plan
terraform apply
```

* Supprimer la vm dans la console.
* Refaire apply (state refresh peut être long).

* terraform state list
* terraform state show google_storage_bucket.storage_example

* Modifier le nom du bucket et de la VM.
* terraform apply -target="google_storage_bucket.storage_example"

* terraform destroy
