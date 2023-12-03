data "google_project" "current-project" {
  project_id = var.project
}

data "google_secret_manager_secret" "github-token-secret" {
  project   = "cloudbuild-386914"
  secret_id = "github-connection-token"
}

data "google_secret_manager_secret_version_access" "github-token-secret-version" {
  project = "cloudbuild-386914"
  secret  = data.google_secret_manager_secret.github-token-secret.id
}
