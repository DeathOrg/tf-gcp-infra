# Create a Virtual Private Cloud (VPC)
resource "google_compute_network" "my_vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Create subnets in the VPC
resource "google_compute_subnetwork" "webapp_subnet" {
  name          = "webapp-subnet"
  ip_cidr_range = "10.1.0.0/24"
  network       = google_compute_network.my_vpc.self_link
  region        = "us-east1"
}

resource "google_compute_subnetwork" "db_subnet" {
  name          = "db-subnet"
  ip_cidr_range = "10.2.0.0/24"
  network       = google_compute_network.my_vpc.self_link
  region        = "us-east1"
}

# Create a route to 0.0.0.0/0 for the webapp subnet
resource "google_compute_route" "webapp_route" {
  name         = "webapp-route"
  network      = google_compute_network.my_vpc.self_link
  dest_range   = "0.0.0.0/0"
  next_hop_gateway = "internet_gateway"
  priority     = 1000

  tags = ["webapp"]
}