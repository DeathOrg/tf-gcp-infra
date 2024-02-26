output "private_ip_address_cloudsql" {
  value       = google_sql_database_instance.webapp_db_instance.private_ip_address
  description = "The private IP address of the newly created My SQL"
}
