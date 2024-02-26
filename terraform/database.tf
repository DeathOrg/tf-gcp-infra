resource "random_id" "db_name_suffix" {
  byte_length = var.db_name_suffix_length
}

resource "google_sql_database_instance" "webapp_db_instance" {
  name                = "private-db-instance-${random_id.db_name_suffix.hex}"
  region              = var.db_instance_region
  database_version    = var.db_instance_database_version
  deletion_protection = var.db_instance_deletion_protection

  settings {
    tier      = var.db_instance_tier
    disk_type = var.db_instance_disk_type
    disk_size = var.db_instance_disk_size
    ip_configuration {
      ipv4_enabled                                  = var.db_instance_ipv4_enabled
      private_network                               = google_compute_network.my_vpc.id
    #   enable_private_path_for_google_cloud_services = var.db_instance_enable_private_path
    }
    availability_type = var.db_instance_availability_type
    backup_configuration {
      enabled            = var.db_instance_backup_enabled
      binary_log_enabled = var.db_instance_backup_binary_log_enabled
    }
  }

  depends_on = [google_service_networking_connection.default]
}

resource "google_sql_database" "webapp_database" {
  name     = var.webapp_database_name
  instance = google_sql_database_instance.webapp_db_instance.name
}

resource "random_password" "generated_password" {
  length           = var.generated_password_length
  special          = var.generated_password_special
  override_special = var.generated_password_override_special
}

resource "google_sql_user" "db_user" {
  name     = var.db_user_name
  instance = google_sql_database_instance.webapp_db_instance.name
  password = random_password.generated_password.result
}
