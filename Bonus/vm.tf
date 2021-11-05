data "google_compute_image" "centos" {
  family  = "centos-7"
  project = "centos-cloud"
}

resource "google_compute_instance_template" "default" {
  name        = "${var.name}-template"
  description = "This template is used to create app server instances."

  region = var.region

  tags = ["foo", "bar"]

  labels = {
    environment = "dev"
  }

  instance_description = "description assigned to instances"
  machine_type         = var.machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = data.google_compute_image.centos.self_link
    auto_delete       = true
    boot              = true
    disk_size_gb = 200
    disk_type = "pd-ssd"
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = file("${path.module}/startup.sh")
}

#resource "google_compute_instance_from_template" "default" {
#  depends_on = [google_compute_instance_template.default]
#  name = "${var.name}-1"
#  zone = var.zone
#  source_instance_template = google_compute_instance_template.default.id
#}