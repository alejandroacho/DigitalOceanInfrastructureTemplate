terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_domain" "domain" {
  ip_address = var.IP_ADDRESS
  name       = var.DOMAIN
}

resource "digitalocean_record" "record" {
  domain = digitalocean_domain.domain.id
  type   = "A"
  name   = "*."
  value  = var.IP_ADDRESS
}
