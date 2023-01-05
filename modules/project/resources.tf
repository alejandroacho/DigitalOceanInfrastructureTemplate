terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_project" "project" {
  description = var.PROJECT_DESCRIPTION
  environment = var.PROJECT_ENVIRONMENT
  name        = var.PROJECT_NAME
  resources   = [
    var.DROPLET_URN,
    var.DOMAIN_URN,
    var.MYSQL_DATABASE_URN,
    var.REDIS_DATABASE_URN,
    var.SPACE_URN
  ]
}
