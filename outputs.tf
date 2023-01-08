output "project_id" {
  value = "${module.project.id}"
}

output "project_creation_date" {
  value = "${module.project.created_at}"
}

output "project_update_date" {
  value = module.project.updated_at
}

output "production_ipv4" {
  value = module.droplets.production_ipv4
}

output "dev_staging_ipv4" {
  value = module.droplets.dev_staging_ipv4
}

output "production_space_domain" {
  value = module.spaces.production_domain
}

output "dev_staging_space_domain" {
  value = module.spaces.dev_staging_domain
}

output "production_mysql_host"{
  value = module.databases.production_mysql_host
}

output "production_mysql_port"{
  value = module.databases.production_mysql_port
}

output "dev_staging_mysql_host"{
  value = module.databases.dev_staging_mysql_host
}

output "dev_staging_mysql_port"{
  value = module.databases.dev_staging_mysql_port
}