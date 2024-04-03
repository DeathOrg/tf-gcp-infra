resource "google_compute_health_check" "webapp_health_check" {
  name        = var.health_check_name
  description = var.health_check_description

  timeout_sec         = var.timeout_sec
  check_interval_sec  = var.check_interval_sec
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold

  http_health_check {
    port = var.health_check_port
    request_path = var.health_check_request_path
  }
}