terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_domain" "production_domain" {
  ip_address = var.PRODUCTION_IP_ADDRESS
  name       = var.DOMAIN
}

resource "digitalocean_record" "production_record" {
  domain = digitalocean_domain.production_domain.id
  value  = var.PRODUCTION_IP_ADDRESS
  type   = "A"
  name   = "*"
}

resource "digitalocean_domain" "dev_domain" {
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  ip_address = var.DEV_STAGING_IP_ADDRESS
  count      = var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = "dev.${var.DOMAIN}"
}

resource "digitalocean_record" "dev_record" {
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  domain = digitalocean_domain.dev_domain[0].id
  count  = var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  value  = var.DEV_STAGING_IP_ADDRESS
  type   = "A"
  name   = "*"
}

resource "digitalocean_domain" "staging_domain" {
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  ip_address = var.DEV_STAGING_IP_ADDRESS
  count      = var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = "staging.${var.DOMAIN}"
}

resource "digitalocean_record" "staging_record" {
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  domain = digitalocean_domain.staging_domain[0].id
  count  = var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  value  = var.DEV_STAGING_IP_ADDRESS
  type   = "A"
  name   = "*"
}
