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
    network = google_compute_network.my_vpc.self_link
    subnetwork = google_compute_subnetwork.webapp_subnet.self_link
    access_config {}
  }

  # Use a startup script to set environment variable using the private IP address
  metadata_startup_script = <<EOF
  #!/bin/bash
  echo "DATABASE_HOST=${google_sql_database_instance.webapp_db_instance.private_ip_address}" >> /home/csye6225/cloud/webapp/config/.env
  echo "DATABASE_USER=${google_sql_user.db_user.name}" >> /home/csye6225/cloud/webapp/config/.env
  echo "DATABASE_PASSWORD=${google_sql_user.db_user.password}" >> /home/csye6225/cloud/webapp/config/.env
  /home/csye6225/cloud/webapp/setup.sh /home/csye6225/cloud/webapp
  touch /home/csye6225/cloud/workdone
  EOF

  depends_on = [ google_sql_database.webapp_database, google_sql_user.db_user ]
}