# Create a Pub/Sub topic
resource "google_pubsub_topic" "verify_email" {
  name = var.pubsub_topic_name
#   message_storage_policy {
#     allowed_persistence_regions = [var.region]
#   }
}

# Create a Pub/Sub subscription
resource "google_pubsub_subscription" "verification_subscription" {
  name  = var.pubsub_subscription_name
  topic = google_pubsub_topic.verify_email.name
}
