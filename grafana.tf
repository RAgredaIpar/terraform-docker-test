resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:main-ubuntu"
  ports {
    internal = 3000
    external = var.grafana_external_port
  }

  networks_advanced {
    name = docker_network.monitor_net.name
  }
}
