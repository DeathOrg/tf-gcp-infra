resource "google_compute_region_instance_template" "webapp_template" {
  name        = "${var.template_name}-${random_id.template_name_suffix.hex}"
  description = var.template_description
  region      = var.region
  tags        = [var.compute_instance_tag]

  instance_description = var.instance_description
  machine_type         = var.machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }


  # Create a new boot disk from an image (same as previous code)
  disk {
    source_image = var.boot_disk_image
    auto_delete  = true
    boot         = true
    source_image_encryption_key {
      kms_key_self_link       = google_kms_key_ring.app_keys.id
      kms_key_service_account = google_service_account.my_sa.email
    }
  }

  network_interface {
    network    = google_compute_network.my_vpc.self_link
    subnetwork = google_compute_subnetwork.webapp_subnet.self_link
    access_config {
    }
  }

  metadata = {
    startup-script = <<EOF
        #!/bin/bash
        echo "DATABASE_HOST=${google_sql_database_instance.webapp_db_instance.private_ip_address}" >> ${var.app_base_path}/config/.env
        echo "DATABASE_USER=${google_sql_user.db_user.name}" >> ${var.app_base_path}/config/.env
        echo "DATABASE_PASSWORD=${google_sql_user.db_user.password}" >> ${var.app_base_path}/config/.env
        echo "PROJECT_ID=${var.project_id}" >> ${var.app_base_path}/config/.env
        echo "DOMAIN_NAME=${var.mailgun_domain}" >> ${var.app_base_path}/config/.env
        ${var.app_base_path}/setup.sh ${var.app_base_path}
        rm -rf /var/log/myapp/app.log
        rm -rf ${var.app_base_path}/LICENSE ${var.app_base_path}/packer/ ${var.app_base_path}/README.md ${var.app_base_path}/requirements/ ${var.app_base_path}/.gitignore
        touch /home/csye6225/cloud/workdone
    EOF
  }

  lifecycle {
    create_before_destroy = true
  }


  service_account {
    email  = google_service_account.my_sa.email
    scopes = var.computer_instance_service_account_scopes
  }

}

resource "random_id" "template_name_suffix" {
  byte_length = var.template_name_suffix_length
}
