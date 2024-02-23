# Create firewall rule
resource "google_compute_firewall" "webapp_firewall" {
  count   = length(var.vpc_names)
  name    = var.allow_firewall_name
  network = google_compute_network.my_vpc[count.index].self_link
  allow {
    protocol = var.protocol
    ports    = [var.application_port]
  }
  target_tags   = [var.compute_instance_tag]
  source_ranges = var.allowed_ips
}

resource "google_compute_firewall" "deny_ssh_firewall" {
  count   = length(var.vpc_names)
  name    = var.deny_firewall_name
  network = google_compute_network.my_vpc[count.index].self_link
  deny {
    protocol = var.protocol
    ports    = [var.ssh_port]
  }
  source_ranges = var.allowed_ips
  target_tags = [var.compute_instance_tag]
}
