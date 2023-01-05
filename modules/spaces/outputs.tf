output "production_domain" {
  value = length(resource.digitalocean_spaces_bucket.production_bucket) > 0 ? (
    resource.digitalocean_spaces_bucket.production_bucket[0].bucket_domain_name
  ) : ""
}

output "production_urn" {
  value = length(resource.digitalocean_spaces_bucket.production_bucket) > 0 ? (
    resource.digitalocean_spaces_bucket.production_bucket[0].urn
  ) : ""
}

output "dev_staging_domain" {
  value = length(resource.digitalocean_spaces_bucket.dev_staging_bucket) > 0 ? (
    resource.digitalocean_spaces_bucket.dev_staging_bucket[0].bucket_domain_name
  ) : ""
}

output "dev_staging_urn" {
  value = length(resource.digitalocean_spaces_bucket.dev_staging_bucket) > 0 ? (
    resource.digitalocean_spaces_bucket.dev_staging_bucket[0].urn
  ) : ""
}
