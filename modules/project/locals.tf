locals {
  possible_resources = [
    var.PRODUCTION_DROPLET_URN,
    var.DEV_STAGING_DROPLET_URN,
    var.PRODUCTION_MYSQL_DATABASE_URN,
    var.PRODUCTION_REDIS_DATABASE_URN,
    var.PRODUCTION_SPACE_URN,
    var.DEV_STAGING_SPACE_URN,
    var.DEV_STAGING_MYSQL_DATABASE_URN,
    var.DEV_STAGING_REDIS_DATABASE_URN,
    var.PRODUCTION_DOMAIN_URN,
    var.STAGING_DOMAIN_URN,
    var.DEV_DOMAIN_URN,
  ]
  resources = compact(local.possible_resources) # Remove empty strings
}