output "production_mysql_urn" {
  value = length(resource.digitalocean_database_cluster.production_mysql) > 0 ? (
    resource.digitalocean_database_cluster.production_mysql[0].urn
  ) : ""
}

output "production_redis_urn" {
  value = length(resource.digitalocean_database_cluster.production_redis) > 0 ? (
    resource.digitalocean_database_cluster.production_redis[0].urn
  ) : ""
}

output "production_mysql_host" {
  value = length(resource.digitalocean_database_cluster.production_mysql) > 0 ? (
    resource.digitalocean_database_cluster.production_mysql[0].host
  ) : ""
}

output "production_mysql_port" {
  value = length(resource.digitalocean_database_cluster.production_mysql) > 0 ? (
    resource.digitalocean_database_cluster.production_mysql[0].port
  ) : ""
}

output "dev_staging_mysql_urn" {
  value = length(resource.digitalocean_database_cluster.dev_staging_mysql) > 0 ? (
    resource.digitalocean_database_cluster.dev_staging_mysql[0].urn
  ) : ""
}

output "dev_staging_redis_urn" {
  value = length(resource.digitalocean_database_cluster.dev_staging_redis) > 0 ? (
    resource.digitalocean_database_cluster.dev_staging_redis[0].urn
  ) : ""
}

output "dev_staging_mysql_host" {
  value = length(resource.digitalocean_database_cluster.dev_staging_mysql) > 0 ? (
    resource.digitalocean_database_cluster.dev_staging_mysql[0].host
  ) : ""
}

output "dev_staging_mysql_port" {
  value = length(resource.digitalocean_database_cluster.dev_staging_mysql) > 0 ? (
    resource.digitalocean_database_cluster.dev_staging_mysql[0].port
  ) : ""
}
