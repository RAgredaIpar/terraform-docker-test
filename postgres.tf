resource "docker_container" "postgres" {
    name = "postgres"
    image = "postgres:13"

    env = [
        "POSTGRES_USER=admin_user",
        "POSTGRES_PASSWORD=admin_pass",
        "POSTGRES_DB=app_db"
    ]

    mounts {
        target = "/var/lib/postgresql/data"
        source = docker_volume.postgres_data.name
        type = "volume"
    }

    networks_advanced {
        name = docker_network.persistence_net.name
    }
}