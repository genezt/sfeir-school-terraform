project_id = "school-terraform-oct25-sbx"
region     = "europe-west9"
gcp_service_list = [
  "compute.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "sqladmin.googleapis.com",
  "secretmanager.googleapis.com"
]
custom_role_permissions = [
  "compute.instances.create",
  "compute.instances.delete",
  "compute.instances.get",
  "compute.instances.setLabels",
  "compute.instances.setMetadata",
  "compute.instances.setServiceAccount",
  "compute.instances.start",
  "compute.instances.stop",
  "compute.disks.create",
  "compute.firewalls.create",
  "compute.firewalls.delete",
  "compute.firewalls.get",
  "compute.firewalls.update",
  "compute.projects.get",
  "compute.networks.get",
  "compute.subnetworks.use",
  "compute.networks.updatePolicy",
  "compute.zones.get"
]
service_account_roles = [
  "roles/iap.tunnelResourceAccessor",
  "roles/compute.osLogin",
  "roles/storage.admin",
  "roles/cloudsql.admin",
  "roles/secretmanager.admin"
]
