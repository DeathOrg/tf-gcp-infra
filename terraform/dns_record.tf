resource "google_dns_record_set" "dns" {
  project      = var.project_id
  name         = var.my_domain
  type         = var.dns_record_A
  ttl          = var.webser_dns_ttl
  managed_zone = var.webserver_managed_zone
  rrdatas      = [google_compute_global_address.default.address]
}

# resource "google_dns_record_set" "web_server" {
#   name = var.my_domain
#   type = var.dns_record_A
#   ttl  = var.webser_dns_ttl
#   managed_zone = var.webserver_managed_zone
#   rrdatas = [google_compute_instance.webapp_instance.network_interface[0].access_config[0].nat_ip]
# }

