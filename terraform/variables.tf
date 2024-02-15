variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_names" {
  type    = list(string)
}

variable "subnet_region" {
  type = string
}

variable "webapp_subnet_name" {
  type = string
}

variable "webapp_subnet_cidr_range" {
  type = string
}

variable "db_subnet_name" {
  type = string
}

variable "db_subnet_cidr_range" {
  type = string
}

variable "webapp_route_name" {
  type = string
}

variable "webapp_route_dest_range" {
  type = string
}