output "domain" {
  value = "${resource.digitalocean_spaces_bucket.bucket.bucket_domain_name}"
}

output "urn" {
  value = "${resource.digitalocean_spaces_bucket.bucket.urn}"
}
