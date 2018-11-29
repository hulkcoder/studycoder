# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "ubuntu" {
  image = "${docker_image.ubuntu.latest}"
  name  = "hwterraform"
}

resource "docker_image" "ubuntu" {
  name = "ubuntu:precise"
}
