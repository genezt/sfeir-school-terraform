# terraform to setup your gcp project lab for this formation

The terraform will need to create a bucket in your project gcp to store the state

## goal

The terraform is activating api:
* compute engine api

The terraform is creating an account service sfeir-school-participant@school-terraform-oct25-sbx.iam.gserviceaccount.com
This account will be use to do the lab

## terraform

### use default login
⚠️ If you run on you local machine, it's recommended to do the same using :

```shell
gcloud auth application-default login
```

### command

```
terraform init
terraform apply
```
