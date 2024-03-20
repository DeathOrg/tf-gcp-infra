resource "google_dns_record_set" "web_server" {
  name = "sourabhk.com."
  type = "A"
  ttl  = 300

  managed_zone = "webapp-zone"

  rrdatas = [google_compute_instance.webapp_instance.network_interface[0].access_config[0].nat_ip]
}
