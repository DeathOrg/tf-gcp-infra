# Create a Key Ring in the region you deploy your resources
resource "google_kms_key_ring" "app_keys" {
  name     = "${var.key_ring_name}-${random_id.template_name_suffix.hex}"
  location = var.key_ring_location
}

# CMEK for Virtual Machines
resource "google_kms_crypto_key" "vm_key" {
  name            = var.cmek_vm_key_name
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = var.key_rotation_period
}

# CMEK for CloudSQL Instances
resource "google_kms_crypto_key" "cloudsql_key" {
  name            = var.cmek_cloudsql_key_name
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = var.key_rotation_period
}

# CMEK for Cloud Storage Buckets
resource "google_kms_crypto_key" "storage_bucket_key" {
  name            = var.cmek_storage_bucket_key_name
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = var.key_rotation_period
}

resource "random_id" "key_ring_name_suffix" {
  byte_length = var.key_ring_name_suffix_length
}


data "google_iam_policy" "admin" {
  binding {
    role = var.roles_kms_encrypter_decrypter
    members = [
      "serviceAccount:service-${var.project_number}@gs-project-accounts.iam.gserviceaccount.com",
    ]
  }
}

resource "google_kms_crypto_key_iam_policy" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.storage_bucket_key.id
  policy_data   = data.google_iam_policy.admin.policy_data
}