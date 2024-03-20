# Create Compute Engine Instance
resource "google_compute_instance" "webapp_instance" {
  name         = var.webapp_instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = [var.compute_instance_tag]
  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      type  = var.boot_disk_type
      size  = var.boot_disk_size_gb
    }
    auto_delete = true
  }

  network_interface {
    network    = google_compute_network.my_vpc.self_link
    subnetwork = google_compute_subnetwork.webapp_subnet.self_link
    access_config {}
  }

  # Use a startup script to set environment variable using the private IP address
  metadata_startup_script = <<EOF
  #!/bin/bash
  echo "DATABASE_HOST=${google_sql_database_instance.webapp_db_instance.private_ip_address}" >> ${var.app_base_path}/config/.env
  echo "DATABASE_USER=${google_sql_user.db_user.name}" >> ${var.app_base_path}/config/.env
  echo "DATABASE_PASSWORD=${google_sql_user.db_user.password}" >> ${var.app_base_path}/config/.env
  ${var.app_base_path}/setup.sh ${var.app_base_path}
  rm -rf /var/log/myapp/app.log
  rm -rf ${var.app_base_path}/LICENSE ${var.app_base_path}/packer/ ${var.app_base_path}/README.md ${var.app_base_path}/requirements/ ${var.app_base_path}/.gitignore
  touch /home/csye6225/cloud/workdone
  EOF

  allow_stopping_for_update = true

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.my_sa.email
    # scopes = ["cloud-platform"]
    scopes = ["logging-write", "monitoring-write"]
  }

  depends_on = [google_sql_database.webapp_database, google_sql_user.db_user, google_service_account.my_sa]
}
