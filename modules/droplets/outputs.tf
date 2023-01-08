output "production_urn" {
  value = resource.digitalocean_droplet.production_droplet.urn
}

output "production_ipv4" {
  value = resource.digitalocean_droplet.production_droplet.ipv4_address
}

output "dev_staging_urn" {
  value = try(resource.digitalocean_droplet.dev_staging_droplet[0].urn, "")
}

output "dev_staging_ipv4" {
  value = try(resource.digitalocean_droplet.dev_staging_droplet[0].ipv4_address, "")
}
