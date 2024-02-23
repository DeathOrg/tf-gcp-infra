# Create firewall rule
resource "google_compute_firewall" "webapp_firewall" {
  count   = length(var.vpc_names)
  name    = var.firewall_name
  network = google_compute_network.my_vpc[count.index].self_link
  allow {
    protocol = var.protocol
    ports    = [var.application_port]
  }
  target_tags   = ["my-vm-instance"]
  source_ranges = var.allowed_ips
}

resource "google_compute_firewall" "deny_ssh_firewall" {
  count   = length(var.vpc_names)
  name    = "deny-ssh-traffic"
  network = google_compute_network.my_vpc[count.index].self_link
  deny {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = var.allowed_ips
  target_tags = ["my-vm-instance"]
}
