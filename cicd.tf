resource "google_cloudbuild_trigger" "main-branch-trigger" {
  location = "us-central1"
  project  = "cloudbuild-386914"

  trigger_template {
    branch_name = "main"
    repo_name   = "mammenarjun2/testcloudbuild"
  }


  filename = "scripts/cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "any-branch-trigger" {
  location = "us-central1"
  project  = "cloudbuild-386914"

  trigger_template {
    branch_name = ".*"
    repo_name   = "mammenarjun2/testcloudbuild"
  }

  filename = "scripts/cloudbuild.yaml"
}
