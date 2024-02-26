# Create a VPC
resource "google_compute_network" "my_vpc" {
  name                            = var.vpc_names
  routing_mode                    = var.vpc_routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes_on_create
}
