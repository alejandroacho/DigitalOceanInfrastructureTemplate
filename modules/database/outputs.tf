output "mysql_urn" {
  value = "${resource.digitalocean_database_cluster.mysql.urn}"
}

output "redis_urn" {
  value = "${resource.digitalocean_database_cluster.redis.urn}"
}

output "mysql_host" {
  value = "${resource.digitalocean_database_cluster.mysql.host}"
}

output "mysql_port" {
  value = "${resource.digitalocean_database_cluster.mysql.port}"
}
