# Create firewall rule
resource "google_compute_firewall" "webapp_firewall" {
  count         = length(var.vpc_names) 
  name          = var.firewall_name
  network       = google_compute_network.my_vpc[count.index].self_link
  allow {
    protocol = var.protocol
    ports    = [var.application_port, var.http_port]
  }

  source_ranges = var.allowed_ips
  depends_on = [google_compute_network.my_vpc]
}
