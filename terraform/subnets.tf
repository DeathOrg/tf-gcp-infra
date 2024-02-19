# Create subnets for each VPC
resource "google_compute_subnetwork" "db_subnet" {
  count         = length(var.vpc_names)
#   name          = "${var.vpc_names[count.index]}-${var.db_subnet_name}"
  name          = var.db_subnet_name
  ip_cidr_range = var.db_subnet_cidr_range
  network       = google_compute_network.my_vpc[count.index].self_link
  region        = var.subnet_region
}

resource "google_compute_subnetwork" "webapp_subnet" {
  count         = length(var.vpc_names)
#   name          = "${var.vpc_names[count.index]}-${var.webapp_subnet_name}"
  name          = var.webapp_subnet_name
  ip_cidr_range = var.webapp_subnet_cidr_range
  network       = google_compute_network.my_vpc[count.index].self_link
  region        = var.subnet_region
}

