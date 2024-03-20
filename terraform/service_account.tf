resource "google_service_account" "my_sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

resource "google_project_iam_binding" "logging_admin" {
  project = var.project_id
  role    = var.roles_logging_admin
  members = ["serviceAccount:${google_service_account.my_sa.email}"]
}

resource "google_project_iam_binding" "monitoring_writer" {
  project = var.project_id
  role    = var.roles_monitoring_writer
  members = ["serviceAccount:${google_service_account.my_sa.email}"]
}
