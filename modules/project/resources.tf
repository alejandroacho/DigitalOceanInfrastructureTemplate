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
  environment = "Production"
  name        = var.PROJECT_NAME
  resources   = [
    var.PRODUCTION_DROPLET_URN,
    var.DEV_STAGING_DROPLET_URN,
    var.PRODUCTION_MYSQL_DATABASE_URN,
    var.PRODUCTION_REDIS_DATABASE_URN,
    var.PRODUCTION_SPACE_URN,
    var.DEV_STAGING_SPACE_URN,
    var.DEV_STAGING_MYSQL_DATABASE_URN,
    var.DEV_STAGING_REDIS_DATABASE_URN,
    var.PRODUCTION_DOMAIN_URN,
    var.STAGING_DOMAIN_URN,
    var.DEV_DOMAIN_URN,
  ]
}
