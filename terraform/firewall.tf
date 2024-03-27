# Create firewall rule
resource "google_compute_firewall" "webapp_firewall" {
  name    = var.allow_firewall_name
  network = google_compute_network.my_vpc.self_link
  allow {
    protocol = var.protocol
    ports    = var.webapp_firewall_allow_ports
  }
  target_tags   = [var.compute_instance_tag]
  source_ranges = var.allowed_ips
}

# resource "google_compute_firewall" "deny_ssh_firewall" {
#   name    = var.deny_firewall_name
#   network = google_compute_network.my_vpc.self_link
#   deny {
#     protocol = var.protocol
#     ports    = [var.ssh_port]
#   }
#   target_tags   = [var.compute_instance_tag]
#   source_ranges = var.allowed_ips
# }
