resource "google_compute_firewall" "allow_health_and_lb" {
  name     = var.firewall_allow_name
  network  = google_compute_network.my_vpc.self_link
  priority = var.firewall_allow_priority

  allow {
    protocol = var.protocol
    ports    = var.webapp_firewall_allow_ports
  }

  # source_ranges = ["0.0.0.0/0"]
  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22",
    google_compute_global_address.default.address,
  ]
}

resource "google_compute_firewall" "deny_all_inbound" {
  name     = var.firewall_deny_name
  network  = google_compute_network.my_vpc.self_link
  priority = var.firewall_deny_priority

  deny {
    protocol = var.protocol
    ports    = [var.application_port]
  }
  source_ranges = ["0.0.0.0/0"]
}

