# Create routes
resource "google_compute_route" "webapp_route" {
  count             = length(var.vpc_names)
  name              = "${var.vpc_names[count.index]}-${var.webapp_route_name}"
  network           = google_compute_network.my_vpc[count.index].self_link
  dest_range        = var.webapp_route_dest_range
  next_hop_gateway  = "default-internet-gateway"
  priority          = 1000
  tags              = ["${var.vpc_names[count.index]}-${var.webapp_subnet_name}"]
}
