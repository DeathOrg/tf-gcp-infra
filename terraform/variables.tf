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
  description = "Port number that the ssh listens to."
  default     = 22
}

variable "https_port" {
  type        = number
  description = "Port number that the https listens to."
  default     = 443
}

variable "mysql_port" {
  type        = number
  description = "Port number that the https listens to."
  default     = 3306
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

variable "db_password" {
  type = string
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
  default = 10
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

variable "my_domain" {
  type    = string
  default = "sourabhk.com."
}

variable "dns_record_A" {
  type    = string
  default = "A"
}

variable "webserver_managed_zone" {
  type    = string
  default = "webapp-zone"
}

variable "webser_dns_ttl" {
  type    = number
  default = 300
}

variable "service_account_id" {
  type    = string
  default = "my-vm-sa"
}

variable "service_account_display_name" {
  type    = string
  default = "My VM-SA"
}

variable "roles_logging_admin" {
  type    = string
  default = "roles/logging.admin"
}
variable "roles_pubsub_publisher" {
  type    = string
  default = "roles/pubsub.publisher"
}

variable "roles_monitoring_writer" {
  type    = string
  default = "roles/monitoring.metricWriter"
}

# Base path variable
variable "app_base_path" {
  description = "Base path for the application"
  default     = "/home/csye6225/cloud/webapp"
}

variable "mailgun_domain" {
  type = string
}

variable "mailgun_api_key" {
  type = string
}

variable "cloud_func_code_path" {
  type = string
}
variable "pubsub_topic_name" {
  type = string
}

variable "pubsub_subscription_name" {
  type = string
}

variable "webapp_firewall_allow_ports" {
  type = list(number)
}


variable "cf_name" {
  type    = string
  default = "send-verification-email"
}
variable "cf_location" {
  type    = string
  default = "us-central1"
}
variable "cf_description" {
  type    = string
  default = "Sends verification emails to users"
}

variable "cf_build_config_runtime" {
  type    = string
  default = "python39"
}


variable "cf_build_config_entry_point" {
  type    = string
  default = "send_verification_email"
}

variable "cf_ingress_setting" {
  type    = string
  default = "ALLOW_INTERNAL_ONLY"
}

variable "cf_trigger_region" {
  type = string
}
variable "cf_event_trigger_type" {
  type    = string
  default = "google.cloud.pubsub.topic.v1.messagePublished"
}

variable "cf_event_trigger_retry_policy" {
  type    = string
  default = "RETRY_POLICY_RETRY"
}

variable "cf_service_config_timeout" {
  type    = number
  default = 60
}

variable "cf_service_config_max_instance_count" {
  type    = number
  default = 3
}

variable "cf_service_config_min_instance_count" {
  type    = number
  default = 1
}

variable "cf_service_config_available_memory" {
  type    = string
  default = "128M"
}


variable "vpc_connector_max_instance_count" {
  type    = number
  default = 3
}

variable "vpc_connector_min_instance_count" {
  type    = number
  default = 2
}

variable "vpc_connector_cidr_range" {
  type    = string
  default = "10.0.2.0/28"
}

variable "vpc_connector_name" {
  type    = string
  default = "vpc-con"
}


variable "storage_bucket_name" {
  type    = string
  default = "verification-email-function-bucket"
}



variable "storage_bucket_location" {
  type    = string
  default = "US-CENTRAL1"
}



variable "storage_bucket_object_name" {
  type    = string
  default = "index.zip"
}

variable "computer_instance_service_account_scopes" {
  type    = list(string)
  default = ["logging-write", "monitoring-write", "pubsub"]
}

# for autoscaler
variable "autoscaler_name" {
  type    = string
  default = "webapp-autoscaler"
}

variable "min_replicas" {
  type        = number
  description = "Minimum number of replicas in the instance group"
  default     = 3
}

variable "max_replicas" {
  type        = number
  description = "Maximum number of replicas allowed in the instance group"
  default     = 6
}

variable "cooldown_period" {
  type        = number
  description = "Cooldown period in seconds after scaling actions (up or down)"
  default     = 60
}

variable "cpu_utilization_target" {
  type        = number
  description = "Target CPU utilization for autoscaling (0.0 to 1.0)"
  default     = 0.50
}


# for health_check

variable "health_check_name" {
  type        = string
  description = "Name of the health check"
  default     = "webapp-health-check"
}

variable "health_check_description" {
  type        = string
  description = "Description of the health check"
  default     = "Health check of webapp service"
}

variable "timeout_sec" {
  type        = number
  description = "Timeout in seconds for the health check probe"
  default     = 1
}

variable "check_interval_sec" {
  type        = number
  description = "Interval in seconds between health checks"
  default     = 1
}

variable "healthy_threshold" {
  type        = number
  description = "Number of successful checks to mark an instance healthy"
  default     = 5
}

variable "unhealthy_threshold" {
  type        = number
  description = "Number of failed checks to mark an instance unhealthy"
  default     = 5
}

variable "health_check_port" {
  type        = number
  description = "Port on which the health check is performed"
  default     = 8000
}

variable "health_check_request_path" {
  type        = string
  description = "Path for the health check request (e.g., /healthz)"
  default     = "/healthz"
}

# for instance template

variable "template_name" {
  type        = string
  description = "Name of the instance template"
  default     = "appserver-template"
}

variable "template_description" {
  type        = string
  description = "Description of the instance template"
  default     = "This template is used to create app server instances."
}

variable "instance_description" {
  type        = string
  description = "Description assigned to instances created from the template"
  default     = "description assigned to instances"
}


# for firewall

variable "firewall_allow_name" {
  type        = string
  description = "Name for the firewall rule allowing health checks and load balancer"
  default     = "allow-health-checks-and-lb"
}

variable "firewall_allow_priority" {
  type        = number
  description = "Priority for the allow rule (lower values are evaluated first)"
  default     = 500
}

variable "firewall_protocol" {
  type        = string
  description = "Network protocol allowed by the rule (e.g., tcp, udp)"
  default     = "tcp"
}

variable "firewall_deny_name" {
  type        = string
  description = "Name for the firewall rule denying all inbound traffic"
  default     = "deny-all-inbound"
}

variable "firewall_deny_priority" {
  type        = number
  description = "Priority for the deny rule (lower values are evaluated first)"
  default     = 900
}


# for mig

variable "instance_group_manager_name" {
  type        = string
  description = "Name for the instance group manager"
  default     = "appserver-igm"
}

variable "instance_group_zone" {
  type        = string
  description = "Zone where the instances will be deployed"
  default     = "us-central1-a"
}

variable "mig_region" {
  type        = string
  default     = "us-central1"
}

variable "mig_distribution_policy_zones" {
  type        = list(string)
  default     = ["us-central1-a", "us-central1-f"]
}

variable "base_instance_name" {
  type    = string
  default = "webapp"
}

variable "named_port_name" {
  type    = string
  default = "my-app-port"
}


# for loadbalancer
variable "lb_address_name" {
  type        = string
  description = "Name for the global address used by the load balancer"
  default     = "l7-xlb-static-ip-address"
}

variable "lb_forwarding_rule_name" {
  type        = string
  description = "Name for the HTTPS forwarding rule"
  default     = "l7-xlb-forwarding-rule"
}

variable "lb_port_range" {
  type        = string
  description = "Port range for the forwarding rule (e.g., 443)"
  default     = "443"
}

variable "lb_https_proxy_name" {
  type        = string
  description = "Name for the target HTTPS proxy"
  default     = "gct-https-proxy"
}

variable "ssl_cert_name" {
  type        = string
  description = "Name for the managed SSL certificate"
  default     = "test-cert-2"
}

variable "ssl_cert_domains" {
  type        = list(string)
  description = "List of domains for the SSL certificate"
  default     = ["sourabhk.com"]
}
variable "lb_url_map_name" {
  type        = string
  description = "Name for the URL map"
  default     = "l7-xlb-url-map"
}

variable "lb_url_map_hosts" {
  type        = list(string)
  description = "List of hostnames for the URL map"
  default     = ["sourabhk.com"]
}

variable "lb_url_map_path_matcher" {
  type    = string
  default = "sourabhk"
}

# Backend service
variable "lb_backend_service_name" {
  type        = string
  description = "Name for the backend service"
  default     = "l7-xlb-backend-service"
}

# Backend service configuration
variable "lb_backend_service_protocol" {
  type        = string
  description = "Protocol used by the backend service (e.g., HTTP, HTTPS)"
  default     = "HTTP"
}

variable "lb_backend_service_timeout_sec" {
  type        = number
  description = "Backend service timeout in seconds"
  default     = 300
}

variable "lb_backend_service_enable_cdn" {
  type        = bool
  description = "Enable Cloud CDN for the backend service"
  default     = false
}
variable "lb_backend_service_log_config_enable" {
  type    = bool
  default = true
}
variable "lb_backend_service_log_config_sample_rate" {
  type    = number
  default = 1
}
variable "lb_backend_service_balancing_mode" {
  type    = string
  default = "UTILIZATION"
}
variable "lb_backend_service_capacity_scaler" {
  type    = number
  default = 1.0
}

variable "lb_backend_service_load_balancing_scheme" {
  type    = string
  default = "EXTERNAL_MANAGED"
}

variable "lb_backend_service_locality_lb_policy" {
  type    = string
  default = "ROUND_ROBIN"
}



variable "template_name_suffix_length" {
  type    = number
  default = 4
}