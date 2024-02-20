# Create a VPC
resource "google_compute_network" "my_vpc" {
  count                           = length(var.vpc_names)
  name                            = var.vpc_names[count.index]
  routing_mode                    = var.vpc_routing_mode[count.index]
  auto_create_subnetworks         = var.auto_create_subnetworks[count.index]
  delete_default_routes_on_create = var.delete_default_routes_on_create[count.index]
}
