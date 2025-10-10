# Enable GCP APIs
resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)

  project = var.project_id
  service = each.key

  disable_on_destroy = false
}

# Create custom IAM role
resource "google_project_iam_custom_role" "sfeir_school_role" {
  role_id     = "userSfeirSchool"
  title       = "User SFEIR School"
  description = "Custom role for SFEIR School participants with Compute Engine permissions"
  project     = var.project_id
  permissions = var.custom_role_permissions
}

# Create service account
resource "google_service_account" "sfeir_school_participant" {
  account_id   = "sfeir-school-participant"
  display_name = "SFEIR School Participant"
  project      = var.project_id
}

# Attach custom role to service account
resource "google_project_iam_member" "sfeir_school_participant_custom_role" {
  project = var.project_id
  role    = google_project_iam_custom_role.sfeir_school_role.id
  member  = "serviceAccount:${google_service_account.sfeir_school_participant.email}"
}

# Attach predefined IAM roles to service account
resource "google_project_iam_member" "sfeir_school_participant_roles" {
  for_each = toset(var.service_account_roles)

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.sfeir_school_participant.email}"
}
