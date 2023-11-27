resource "google_cloudbuild_trigger" "filename-trigger" {
  location = "us-central1"
  project  = "cloudbuild-386914"

  trigger_template {
    branch_name = "main"
    repo_name   = "mammenarjun2/testcloudbuild"
  }

  filename = "scripts/cloudbuild.yaml"
}