resource "google_compute_instance" "vpn" {
  name         = "vm-instance"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = 20
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = file("startup-script.sh")

  tags = ["vpn-server"]
}

output "instance_ip" {
  value = google_compute_instance.vpn.network_interface[0].access_config[0].nat_ip
}