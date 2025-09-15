resource "docker_volume" "redis_data" {
    name = "redis_data"
}

resource "docker_volume" "postgres_data" {
    name = "postgres_data"
}