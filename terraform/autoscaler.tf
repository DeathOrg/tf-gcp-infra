resource "google_compute_region_autoscaler" "default" {
  name = var.autoscaler_name
  #   target = google_compute_instance_group_manager.webapp_mig.id
  target = google_compute_region_instance_group_manager.webapp_mig.id

  region = var.region
  #   zone = var.zone


  autoscaling_policy {
    min_replicas    = var.min_replicas    #1
    max_replicas    = var.max_replicas    #4
    cooldown_period = var.cooldown_period #60

    cpu_utilization {
      target = var.cpu_utilization_target #0.50
    }
  }
}