# Create subnets for each VPC
resource "google_compute_subnetwork" "db_subnet" {
  name                     = var.db_subnet_name
  ip_cidr_range            = var.db_subnet_cidr_range
  network                  = google_compute_network.my_vpc.self_link
  region                   = var.subnet_region
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "webapp_subnet" {
  name          = var.webapp_subnet_name
  ip_cidr_range = var.webapp_subnet_cidr_range
  network       = google_compute_network.my_vpc.self_link
  region        = var.subnet_region
}