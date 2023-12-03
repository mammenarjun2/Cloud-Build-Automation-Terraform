terraform {
  required_version = ">= 1.3"

  backend "gcs" {bucket = "tf-state-${PROJECT_ID}"}
}
