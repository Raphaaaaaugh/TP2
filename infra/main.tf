terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}


resource "docker_image" "build" {
  name = "build"
  build{
    context =".."
    dockerfile ="./Dockerfile.dev"
  }
}


resource "docker_container" "container" {
  image = docker_image.build.image_id
  name  = "container"
  # ouvrir les ports 4200 (port d'angular interne par défaut) et 8080 pour docker
  ports {
    internal = 4200
    external = 8080
  }
}

