resource "google_vpc_access_connector" "connector" {
  name          = var.vpc_connector_name
  ip_cidr_range = var.vpc_connector_cidr_range
  network       = google_compute_network.my_vpc.name
  region        = var.region
  project       = var.project_id
  min_instances = var.vpc_connector_min_instance_count
  max_instances = var.vpc_connector_max_instance_count
}


resource "google_storage_bucket" "bucket" {
  name     = var.storage_bucket_name
  location = var.storage_bucket_location
}

resource "google_storage_bucket_object" "archive" {
  name   = var.storage_bucket_object_name
  bucket = google_storage_bucket.bucket.name
  source = var.cloud_func_code_path
}

resource "google_cloudfunctions2_function" "function" {
  name        = var.cf_name
  location    = var.cf_location
  description = var.cf_description
  build_config {
    runtime     = var.cf_build_config_runtime
    entry_point = var.cf_build_config_entry_point
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.archive.name
      }
    }
  }
  service_config {
    max_instance_count = var.cf_service_config_max_instance_count
    min_instance_count = var.cf_service_config_min_instance_count
    available_memory   = var.cf_service_config_available_memory
    timeout_seconds    = var.cf_service_config_timeout
    environment_variables = {
      MAILGUN_DOMAIN   = var.mailgun_domain
      MAILGUN_API_KEY  = var.mailgun_api_key
      DB_HOSTNAME      = google_sql_database_instance.webapp_db_instance.private_ip_address
      DB_USERNAME      = var.db_user_name
      DB_PASSWORD      = google_sql_user.db_user.password
      DB_DATABASE_NAME = var.webapp_database_name
      DB_PORT          = var.mysql_port
    }
    ingress_settings               = var.cf_ingress_setting
    all_traffic_on_latest_revision = true
    service_account_email          = google_service_account.my_sa.email
    vpc_connector                  = google_vpc_access_connector.connector.self_link
  }

  event_trigger {
    trigger_region = var.cf_trigger_region
    event_type     = var.cf_event_trigger_type
    pubsub_topic   = google_pubsub_topic.verify_email.id
    retry_policy   = var.cf_event_trigger_retry_policy
  }
}
