resource "google_secret_manager_secret" "github-token-secret" {
  secret_id = "github-token-secret"
  project     = "cloudbuild-386914"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "github-token-secret-version" {
  secret = google_secret_manager_secret.github-token-secret.id
  secret_data = file("my-github-token.txt")
  
}  

resource "google_cloudbuildv2_connection" "github" {
  provider = google-beta

  project  = "cloudbuild-386914"
  location = "us-central1"
  name     = "github-connection"

  github_config {
    app_installation_id = "44594018"
    authorizer_credential {
      oauth_token_secret_version = google_secret_manager_secret_version.github-token-secret-version.id
    }
  }
}

resource "google_cloudbuildv2_repository" "github" {
  provider = google-beta

  project           = "cloudbuild-386914"
  location          = "us-central1"
  name              = "testcloudbuild"
  parent_connection = google_cloudbuildv2_connection.github.name
  remote_uri        = "https://github.com/mammenarjun2/testcloudbuild.git"

  depends_on = [google_cloudbuildv2_connection.github]
}


data "google_iam_policy" "cloudbuild-github-connection" {
  provider = google-beta

  binding {
    role    = "roles/secretmanager.secretAccessor"
    members = ["serviceAccount:service-1089542086486@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
  }
}

resource "google_secret_manager_secret_iam_policy" "cloudbuild-github-connection" {
  provider = google-beta

  project     = "cloudbuild-386914"
  secret_id   = google_secret_manager_secret.github-token-secret.secret_id
  policy_data = data.google_iam_policy.cloudbuild-github-connection.policy_data
}

# Create Cloud Build trigger for pull requests
resource "google_cloudbuild_trigger" "pr-branch-trigger" {
  location = "us-central1"
  project  = "cloudbuild-386914"
  name     = "pr-branch"

  repository_event_config {
    repository = google_cloudbuildv2_repository.github.id
    pull_request {
      branch = ".*"
    }
  }

  filename       = "cloudbuild.yaml"
  included_files = ["**"]

  depends_on = [google_cloudbuildv2_repository.github]
}
