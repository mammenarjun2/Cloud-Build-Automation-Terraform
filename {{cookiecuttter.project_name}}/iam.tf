locals {
  cloud_build_impersonate_roles = [
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser",
  ]

  iam_automation_sa_project_roles = [
    "roles/cloudbuild.builds.viewer",
    "roles/cloudbuild.connectionViewer",
    "roles/iam.serviceAccountViewer",
    "roles/logging.logWriter",
    "roles/secretmanager.viewer",
    "roles/secretmanager.secretAccessor",
    "roles/storage.admin",
  ]
}

resource "google_service_account" "iam-automation" {
  project      = var.project
  account_id   = "iam-automation"
  display_name = "Service Account for Iam automation"
}

# Allow Cloud Build to issue builds using a user-specified service account

resource "google_service_account_iam_member" "cloud-build-sa-permissions" {
  for_each = toset(local.cloud_build_impersonate_roles)

  service_account_id = google_service_account.iam-automation.name
  role               = each.value
  member             = "serviceAccount:${data.google_project.current-project.number}@cloudbuild.gserviceaccount.com"
}

# Permissions needed for the service account to apply the necessary changes

resource "google_project_iam_member" "iam-automation-sa-permissions" {
  for_each = toset(local.iam_automation_sa_project_roles)

  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.iam-automation.email}"
}





# standard Iam role's below
/*
resource "google_project_iam_binding" "project" {
  project = "your-project-id"
  role    = "roles/editor"

  members = [
    "user:test@example.com",
  ]
}


resource "google_project_iam_binding" "project" {
  project = "your-project-id"
  role    = "roles/viewer"

  members = [
    "user:test@example.com",
  ]
}
*/