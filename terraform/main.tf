# Provider configuration
provider "google" {
  project     = "tf-gcp-infra-27"
  credentials = file("credentials.json")
  region      = "us-east1"
}
