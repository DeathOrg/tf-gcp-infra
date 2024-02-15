# Create a VPC
resource "google_compute_network" "my_vpc" {
  count                   = length(var.vpc_names)
  name                    = var.vpc_names[count.index]
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
