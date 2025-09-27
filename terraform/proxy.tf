resource "docker_container" "nginx_proxy" {
    name = "nginx_proxy"
    image = "nginx:1.29.1-perl"

    networks_advanced {
        name = docker_network.app_net.name
    }

    ports {
        internal = 80
        external = var.nginx_proxy_external_port[terraform.workspace]
    }

    volumes {
      host_path         = abspath("${path.module}/../host_volumes/nginx_conf")
      container_path    = "/etc/nginx/conf.d"
      read_only         = false
    }

    volumes {
      host_path         = abspath("${path.module}/../host_volumes/web")
      container_path    = "/usr/share/nginx/html"
      read_only         = false
    }

    depends_on = [ 
        docker_network.app_net 
    ]

    # restart = "always"
}