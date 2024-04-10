# Create routes
resource "google_compute_route" "webapp_route" {
  name             = "${var.vpc_names}-${var.webapp_route_name}"
  network          = google_compute_network.my_vpc.self_link
  dest_range       = var.webapp_route_dest_range
  next_hop_gateway = var.next_hop_gateway
  priority         = var.route_priority
}
