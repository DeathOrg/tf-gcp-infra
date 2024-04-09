

# Create a Key Ring in the region you deploy your resources
resource "google_kms_key_ring" "app_keys" {
  name     = "key-ring-3"
  location = "us-central1"
}

# CMEK for Virtual Machines
resource "google_kms_crypto_key" "vm_key" {
  name            = "cmek-vm-key"
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = "86401s"
}

# CMEK for CloudSQL Instances
resource "google_kms_crypto_key" "cloudsql_key" {
  name            = "cmek-cloudsql-key"
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = "86401s"
}

# CMEK for Cloud Storage Buckets
resource "google_kms_crypto_key" "storage_bucket_key" {
  name            = "cmek-storage-key"
  key_ring        = google_kms_key_ring.app_keys.id
  rotation_period = "86401s"
}

# data "google_iam_policy" "my_iam_policy" {
#   binding {
#     role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
#     members = [
#       "serviceAccount:service-87566550422@compute-system.iam.gserviceaccount.com",
#     ]
#   }
# }

# data "google_kms_crypto_key_iam_policy" "crypto_key_policy" {
#   crypto_key_id = google_kms_crypto_key.vm_key.id
# }

# # CMEK for CloudSQL Instances
# resource "google_kms_crypto_key" "cloudsql_key" {
#   name         = "cmek-cloudsql-key2"
#   key_ring        = google_kms_key_ring.app_keys.id
#   rotation_period = "2592000s"
# }


# # CMEK for Cloud Storage Buckets
# resource "google_kms_crypto_key" "storage_bucket_key"{
#   name         = "cmek-storage-key2"
#   key_ring        = google_kms_key_ring.app_keys.id
#   rotation_period = "2592000s"
# }

# # resource "google_kms_crypto_key_iam_binding" "storage_bucket_key_binding" {
# #   crypto_key_id = google_kms_crypto_key.storage_bucket_key.id
# #   role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

# #   members = [
# #      "serviceAccount:service-87566550422@tf-gcp-infra-27.iam.gserviceaccount.com",
# #   ]
# # }

# # resource "google_kms_crypto_key_iam_binding" "vm_key_binding" {
# #   provider      = google-beta
# #   crypto_key_id = google_kms_crypto_key.vm_key.id
# #   role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

# #   members = [
# #     "serviceAccount:${google_service_account.my_sa.email}",
# #   ]
# # }

# # resource "google_kms_crypto_key_iam_binding" "cloudsql_key_binding" {
# #   provider      = google-beta
# #   crypto_key_id = google_kms_crypto_key.cloudsql_key.id
# #   role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

# #   members = [
# #     "serviceAccount:${google_service_account.my_sa.email}",
# #   ]
# # }

# # resource "google_kms_crypto_key_iam_binding" "storage_bucket_key_binding" {
# #   provider      = google-beta
# #   crypto_key_id = google_kms_crypto_key.storage_bucket_key.id
# # #   role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter" 
# #   role          = "roles/cloudkms.admin"

# #   members = [
# #     "serviceAccount:service-87566550422@gs-project-accounts.iam.gserviceaccount.com",
# #     "serviceAccount:service-87566550422@compute-system.iam.gserviceaccount.com",

# #   ]
# # }
