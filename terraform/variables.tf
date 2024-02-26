variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "region" {
  type        = string
  description = "The region where resources will be deployed."
}

variable "vpc_names" {
  type        = string
  description = "List of names for the VPCs to be created."
}

variable "vpc_routing_mode" {
  type        = string
  description = "List of routing modes for the VPCs. Valid values are 'GLOBAL' or 'REGIONAL'."
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "Whether subnetworks should be automatically created within the VPC."
}

variable "delete_default_routes_on_create" {
  type        = bool
  description = "Whether default routes should be deleted on VPC creation."
}

variable "subnet_region" {
  type        = string
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
  type        = string
  description = "The name of the next hop gateway for routing traffic."
}

variable "route_priority" {
  type        = number
  description = "The priority of the route."
}

variable "application_port" {
  type        = number
  description = "Port number that the application listens to."
}

variable "http_port" {
  type        = number
  description = "Port number that the http listens to."
  default     = 80
}

variable "ssh_port" {
  type        = number
  description = "Port number that the http listens to."
  default     = 22
}

variable "allow_firewall_name" {
  type        = string
  description = "Name of the allow firewall"
}

variable "deny_firewall_name" {
  type        = string
  description = "Name of the deny firewall"
}

variable "protocol" {
  type = string
}

variable "zone" {
  type        = string
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

variable "compute_instance_tag" {
  type        = string
  description = "tag for compute instance"
}

variable "webapp_instance_name" {
  type        = string
  description = "webapp instance name"
}

variable "db_name_suffix_length" {
  type    = number
  default = 4
}

variable "db_instance_region" {
  type    = string
  default = "us-central1"
}

variable "db_instance_database_version" {
  type    = string
  default = "MYSQL_8_0"
}

variable "db_instance_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "db_instance_disk_type" {
  type    = string
  default = "PD_SSD"
}

variable "db_instance_disk_size" {
  type    = number
  default = 10
}

variable "db_instance_enable_private_path" {
  type    = bool
  default = true
}

variable "db_instance_availability_type" {
  type    = string
  default = "REGIONAL"
}

variable "db_instance_backup_enabled" {
  type    = bool
  default = true
}

variable "db_instance_backup_binary_log_enabled" {
  type    = bool
  default = true
}

variable "webapp_database_name" {
  type    = string
  default = "webApp"
}

variable "db_user_name" {
  type    = string
  default = "dev-1"
}

variable "generated_password_length" {
  type    = number
  default = 16
}

variable "generated_password_special" {
  type    = bool
  default = true
}

variable "generated_password_override_special" {
  type    = string
  default = "_%@"
}


variable "private_ip_alloc_name" {
  type    = string
  default = "private-ip-alloc"
}

variable "private_ip_alloc_purpose" {
  type    = string
  default = "VPC_PEERING"
}

variable "private_ip_alloc_address_type" {
  type    = string
  default = "INTERNAL"
}

variable "private_ip_alloc_prefix_length" {
  type    = number
  default = 16
}

variable "service_networking_service" {
  type    = string
  default = "servicenetworking.googleapis.com"
}

variable "db_instance_deletion_protection" {
  type    = bool
  default = false
}

variable "db_instance_ipv4_enabled" {
  type    = bool
  default = false
}
