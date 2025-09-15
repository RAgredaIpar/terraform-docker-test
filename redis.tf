resource "docker_container" "redis" {
    name = "redis"
    image = "redis:8.2"

    mounts {
        target = "/data"
        source = docker_volume.redis_data.name
        type = "volume"
    }

    networks_advanced {
        name = docker_network.persistence_net.name
    }
}