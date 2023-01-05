terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "droplet" {
  image  = "ubuntu-22-10-x64"
  name   = "${var.PROJECT_NAME}${local.DROPLET}"
  region = "${var.REGION}"
  size   = "s-1vcpu-2gb"
  tags   = ["${var.PROJECT_NAME}"]
}
