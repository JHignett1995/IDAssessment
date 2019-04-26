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
    network       = "{id-mobile-net}"
    access_config = {
    }
  }
  provisioner "file" {
    source      = "setup.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/setup.sh",
      "/tmp/setup.sh args",
    ]
  }
}

 resource "google_compute_network" "vpc_network"{
  name = "id-mobile-net"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
 }
resource "google_compute_firewall" "default" {
  name    = "idm-firewall"
  network = "id-mobile-net"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "3000"]
  }
}
