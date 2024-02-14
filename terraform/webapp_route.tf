data "google_compute_subnetwork" "webapp_subnet" {
  name = var.webapp_subnet_name
  region = var.region
}

resource "google_compute_route" "webapp_route" {
  name       = var.webapp_route_name
  network    = google_compute_network.my_vpc.self_link
  dest_range = var.webapp_route_dest_range

  next_hop_ip = data.google_compute_subnetwork.webapp_subnet.gateway_address

  priority   = 1000
  tags       = ["webapp"]
}