resource "google_compute_global_address" "private_ip_alloc" {
  name          = var.private_ip_alloc_name
  purpose       = var.private_ip_alloc_purpose
  address_type  = var.private_ip_alloc_address_type
  prefix_length = var.private_ip_alloc_prefix_length
  network       = google_compute_network.my_vpc.id
}

resource "google_service_networking_connection" "default" {
  network                 = google_compute_network.my_vpc.id
  service                 = var.service_networking_service
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}
