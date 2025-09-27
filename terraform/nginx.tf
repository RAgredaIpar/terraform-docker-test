resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "nginx:1.29.1-perl"

  volumes {
    host_path       = abspath("${path.module}/../host_volumes/app1_web")
    container_path  = "/usr/share/nginx/html"
    read_only       = false
  }

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
  image = "nginx:1.29.1-perl"

  volumes {
    host_path       = abspath("${path.module}/../host_volumes/app2_web")
    container_path  = "/usr/share/nginx/html"
    read_only       = false
  }

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
  image = "nginx:1.29.1-perl"

  volumes {
    host_path       = abspath("${path.module}/../host_volumes/app3_web")
    container_path  = "/usr/share/nginx/html"
    read_only       = false
  }

  networks_advanced {
    name = docker_network.app_net.name
    aliases = ["app3"]
  }
  networks_advanced {
    name = docker_network.persistence_net.name
  }
}

