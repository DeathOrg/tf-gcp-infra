output "DATABASE_HOST" {
  value       = google_sql_database_instance.webapp_db_instance.private_ip_address
  description = "The private IP address of the newly created My SQL"
}

output "DATABASE_PASSWORD" {
  value       = google_sql_user.db_user.password
  sensitive = true
  # terraform output -no-color DATABASE_PASSWORD
}

output "IT_KEY_RING" {
  value       = google_kms_key_ring.app_keys.name
}