provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.primary.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
    token = data.google_client_config.provider.access_token
  }
}

resource "helm_release" "airflow-test" {
  depends_on = [google_container_node_pool.primary_nodes]
  name       = "airflow-test"
  namespace = "airflow"
  create_namespace = true
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  wait = false

  set {
    name  = "webserver.service.type"
    value = "NodePort"
  }
  set {
    name = "flower.service.type"
    value = "NodePort"
  }
}