resource "google_container_cluster" "primary" {
  name             = "atlantis-cluster"
  location         = "us-central1-a"
  enable_autopilot = true
}
