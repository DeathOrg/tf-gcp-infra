resource "google_dns_record_set" "web_server" {
  name = var.my_domain
  type = var.dns_record_A
  ttl  = 300

  managed_zone = var.webserver_managed_zone

  rrdatas = [google_compute_instance.webapp_instance.network_interface[0].access_config[0].nat_ip]
}
