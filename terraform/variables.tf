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

variable "application_port" {
  type        = number
  description = "Port number that the application listens to."
}

variable "http_port" {
  type        = number
  description = "Port number that the http listens to."
}

variable "firewall_name" {
  type        = string
  description = "Name of the firewall"
}

variable "protocol" {
  type    = string
}

variable "zone" {
  type        = list(string)
  description = "The zone where the instances will be deployed."
}

variable "machine_type" {
  type        = string
  description = "The machine type of the instance."
}

variable "boot_disk_image" {
  type        = string
  description = "The image to use for the boot disk."
}

variable "boot_disk_type" {
  type        = string
  description = "The type of the boot disk."
}

variable "boot_disk_size_gb" {
  type        = number
  description = "The size of the boot disk in GB."
}

variable "allowed_ips" {
  type        = list(string)
  description = "List of allowed of ips in firewall."
}

variable "instance_traffic_tag" {
  type        = string
  description = "instance_traffic_tag"
}