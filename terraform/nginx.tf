resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "hashicorp/http-echo:1.0"
 
  command = [
        "-text", "Hola soy la pagina 1"
    ]

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app1"]
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "hashicorp/http-echo:1.0"

  command = [
        "-text", "Hola soy la pagina 2"
  ]

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app2"]
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}
resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "hashicorp/http-echo:1.0"
  
  command = [
        "-text", "Hola soy la pagina 3"
  ]

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app3"]
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

