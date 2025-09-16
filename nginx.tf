resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"
  ports {
    internal = 80
    external = var.nginx_external_port_1[terraform.workspace]
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"
  ports {
    internal = 80
    external = var.nginx_external_port_2[terraform.workspace]
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "nginx:stable-alpine3.21-perl"
  ports {
    internal = 80
    external = var.nginx_external_port_3[terraform.workspace]
  }
  networks_advanced {
    name = docker_network.app_net.name
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
