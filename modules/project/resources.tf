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
  resources   = local.resources
  name        = var.PROJECT_NAME
}
