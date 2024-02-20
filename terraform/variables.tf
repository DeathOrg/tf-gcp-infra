variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "region" {
  type        = string
  description = "The region where resources will be deployed."
}

variable "vpc_names" {
  type        = list(string)
  description = "List of names for the VPCs to be created."
}

variable "vpc_routing_mode" {
  type        = list(string)
  description = "List of routing modes for the VPCs. Valid values are 'GLOBAL' or 'REGIONAL'."
}

variable "auto_create_subnetworks" {
  type        = list(bool)
  description = "Whether subnetworks should be automatically created within the VPC."
}

variable "delete_default_routes_on_create" {
  type        = list(bool)
  description = "Whether default routes should be deleted on VPC creation."
}

variable "subnet_region" {
  type        = list(string)
  description = "The region where subnets will be created."
}

variable "webapp_subnet_name" {
  type        = string
  description = "Name of the subnet for the web application."
}

variable "webapp_subnet_cidr_range" {
  type        = string
  description = "CIDR range for the subnet used by the web application."
}

variable "db_subnet_name" {
  type        = string
  description = "Name of the subnet for the database."
}

variable "db_subnet_cidr_range" {
  type        = string
  description = "CIDR range for the subnet used by the database."
}

variable "webapp_route_name" {
  type        = string
  description = "Name of the route for the web application subnet."
}

variable "webapp_route_dest_range" {
  type        = string
  description = "Destination CIDR range for the route to the web application subnet."
}

variable "next_hop_gateway" {
  type        = list(string)
  description = "The name of the next hop gateway for routing traffic."
}

variable "route_priority" {
  type        = list(number)
  description = "The priority of the route."
}
