output "production_domain" {
  value = try(resource.digitalocean_spaces_bucket.production_bucket[0].bucket_domain_name, "")
}

output "production_urn" {
  value = try(resource.digitalocean_spaces_bucket.production_bucket[0].urn, "")
}

output "dev_staging_domain" {
  value = try(resource.digitalocean_spaces_bucket.dev_staging_bucket[0].bucket_domain_name, "")
}

output "dev_staging_urn" {
  value = try(resource.digitalocean_spaces_bucket.dev_staging_bucket[0].urn, "")
}
