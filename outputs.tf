output "project_id" {
  value = "${module.project.id}"
}

output "project_creation_date" {
  value = "${module.project.created_at}"
}

output "project_update_date" {
  value = "${module.project.updated_at}"
}

output "ipv4" {
  value = "${module.droplet.ipv4}"
}

output "space_domain" {
  value = "${module.space.domain}"
}

output "mysql_host"{
  value = "${module.database.mysql_host}"
}

output "mysql_port"{
  value = "${module.database.mysql_port}"
}
