provider "google" {
  project = "{IDMobile-Assignment}"
  region  = "europe-west2"
  zone    = "europe-west2-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "id-mobile-assignment"
  machine_type = "n1-standard-1"

  boot_disk {
    initialize_params {
      image = "centos-7-v20190423"
    }
  }

  network_interface {
    network       = "{id-mobilt-net}"
    access_config = {
    }
  }
}

 resource "google_compute_network" "vpc_network"{
  name = "id-mobile-net"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
 }
