resource "docker_network" "app_net" {
    name = "app_net-${terraform.workspace}"
}

resource "docker_network" "persistence_net" {
    name = "persistence_net-${terraform.workspace}"
}

resource "docker_network" "monitor_net" {
    name = "monitor_net-${terraform.workspace}"
}