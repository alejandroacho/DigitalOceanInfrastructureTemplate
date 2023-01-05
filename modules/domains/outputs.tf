output "production_domain_urn" {
  value = resource.digitalocean_domain.production_domain.urn
}

output "dev_domain_urn" {
  value = length(resource.digitalocean_domain.dev_domain) > 0 ? (
    resource.digitalocean_domain.dev_domain[0].urn
  ) : ""
}

output "staging_domain_urn" {
  value = length(resource.digitalocean_domain.staging_domain) > 0 ? (
    resource.digitalocean_domain.staging_domain[0].urn
  ) : ""
}