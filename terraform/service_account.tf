resource "google_project_service_identity" "gcp_sa_cloud_sql" {
  project  = var.project_id
  provider = google-beta
  service  = var.cloud_sql_service
}

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

resource "google_project_iam_binding" "pubsub_publisher_binding" {
  project = var.project_id
  role    = var.roles_pubsub_publisher
  members = ["serviceAccount:${google_service_account.my_sa.email}"]
}

resource "google_project_iam_binding" "cmek_binding" {
  project = var.project_id
  role    = var.roles_kms_encrypter_decrypter
  members = [
    "serviceAccount:${google_service_account.my_sa.email}",
    "serviceAccount:${google_project_service_identity.gcp_sa_cloud_sql.email}",
    "serviceAccount:service-${var.project_number}@gs-project-accounts.iam.gserviceaccount.com",
    "serviceAccount:service-${var.project_number}@compute-system.iam.gserviceaccount.com",
    # "serviceAccount:cloud-storage-admin@${var.project_number}.iam.gserviceaccount.com"
  ]
}