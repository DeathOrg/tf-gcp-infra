# Create Compute Engine Instance
resource "google_compute_instance" "webapp_instance" {
  count        = length(var.vpc_names)
  name         = "${var.vpc_names[count.index]}-webapp-instance"
  machine_type = var.machine_type
  zone         = var.zone[count.index]
  tags         = [var.instance_traffic_tag, "${var.vpc_names[count.index]}", var.webapp_subnet_name]
  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      type  = var.boot_disk_type
      size  = var.boot_disk_size_gb
    }
  }

  network_interface {
    network = google_compute_network.my_vpc[count.index].self_link
    subnetwork = google_compute_subnetwork.webapp_subnet[count.index].self_link
    access_config {}
  }

}