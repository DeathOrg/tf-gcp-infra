# reserved IP address
resource "google_compute_global_address" "default" {
  project      = var.project_id
  name         = var.lb_address_name
  ip_version   = "IPV4"
  address_type = "EXTERNAL"

}

# forwarding rule
resource "google_compute_global_forwarding_rule" "https" {
  name     = var.lb_forwarding_rule_name
  provider = google-beta
  project  = var.project_id

  ip_protocol           = "TCP"
  port_range            = var.lb_port_range
  load_balancing_scheme = "EXTERNAL_MANAGED"
  target                = google_compute_target_https_proxy.default.id
  ip_address            = google_compute_global_address.default.id
  depends_on            = [google_compute_target_https_proxy.default]
}


resource "google_compute_target_https_proxy" "default" {
  project          = var.project_id
  name             = var.lb_https_proxy_name
  url_map          = google_compute_url_map.default.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
  depends_on       = [google_compute_managed_ssl_certificate.default]
}

resource "google_compute_managed_ssl_certificate" "default" {
  name = var.ssl_cert_name
  lifecycle {
    create_before_destroy = true
  }
  managed {
    domains = var.ssl_cert_domains
  }
}

# resource "google_compute_ssl_certificate" "default" {
#   name_prefix = "my-certificate-"
#   description = "a description"
#   private_key = file("/Users/sourabhkumar/Documents/NEU/Sem-2/Cloud/project/ssl_certificate/cert-key.pem")
#   certificate = file("/Users/sourabhkumar/Documents/NEU/Sem-2/Cloud/project/ssl_certificate/fullchain.pem")

#   lifecycle {
#     create_before_destroy = true
#   }
# }



resource "google_compute_url_map" "default" {
  name            = var.lb_url_map_name
  provider        = google-beta
  project         = var.project_id
  default_service = google_compute_backend_service.default.id
  host_rule {
    hosts        = var.lb_url_map_hosts
    path_matcher = var.lb_url_map_path_matcher
  }

  path_matcher {
    name            = var.lb_url_map_path_matcher
    default_service = google_compute_backend_service.default.id

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.default.id
    }
  }
  depends_on = [google_compute_backend_service.default]

}


# backend service with custom request and response headers
resource "google_compute_backend_service" "default" {
  name                  = var.lb_backend_service_name
  provider              = google-beta
  project               = var.project_id
  protocol              = var.lb_backend_service_protocol
  port_name             = var.named_port_name
  load_balancing_scheme = var.lb_backend_service_load_balancing_scheme
  locality_lb_policy    = var.lb_backend_service_locality_lb_policy
  timeout_sec           = var.lb_backend_service_timeout_sec
  enable_cdn            = var.lb_backend_service_enable_cdn
  log_config {
    enable      = var.lb_backend_service_log_config_enable
    sample_rate = var.lb_backend_service_log_config_sample_rate
  }

  health_checks = [google_compute_health_check.webapp_health_check.id]
  backend {
    group           = google_compute_region_instance_group_manager.webapp_mig.instance_group
    balancing_mode  = var.lb_backend_service_balancing_mode
    capacity_scaler = var.lb_backend_service_capacity_scaler
  }
}
