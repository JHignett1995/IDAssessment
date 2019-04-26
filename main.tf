provide = "google" {
 project = "IDMobile-Assignment"
 region = "europe-west2"
 zone = "europe-west2-a"
}
resource "google_compute_network" "vpc_network"{
 name = "IDMobileAssignment-a"
 auto_create_subnetworks = "false"
 routing_mode = "regional"
}
