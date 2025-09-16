resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = "grafana/grafana:main-ubuntu"
  ports {
    internal = 3000
    external = var.grafana_external_port[terraform.workspace]
  }

  networks_advanced {
    name = docker_network.monitor_net.name
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
}
