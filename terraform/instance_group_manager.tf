resource "google_compute_instance_group_manager" "webapp_mig" {
  name               = var.instance_group_manager_name
  base_instance_name = var.base_instance_name
  zone               = var.instance_group_zone

  version {
    instance_template = google_compute_instance_template.webapp_template.self_link
  }

  named_port {
    name = var.named_port_name
    port = var.application_port
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.webapp_health_check.id
    initial_delay_sec = 300
  }
  depends_on = [google_compute_instance_template.webapp_template]
}
