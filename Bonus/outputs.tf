#output "webserver_ip" {
#  value = google_compute_instance_from_template.default.network_interface.0.access_config.0.nat_ip
#}