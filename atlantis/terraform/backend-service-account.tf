data google_storage_bucket terraform_storage {
  name = "grafana-cloud-terraform"
}

resource google_service_account backend_service_account {
  account_id   = "backend"
  display_name = "Backend Service Account"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = data.google_storage_bucket.terraform_storage.name
  role = "roles/storage.admin"
  member = join(":", ["serviceAccount", google_service_account.backend_service_account.email])
}