output "urn" {
  value = "${resource.digitalocean_droplet.droplet.urn}"
}

output "ipv4" {
  value = "${resource.digitalocean_droplet.droplet.ipv4_address}"
}
