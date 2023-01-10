terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  spaces_secret_key = var.DIGITALOCEAN_SPACES_SECRET
  spaces_access_id  = var.DIGITALOCEAN_SPACES_CLIENT_ID
  token             = var.DIGITALOCEAN_ACCESS_TOKEN
}

module "project" {
  DEV_STAGING_MYSQL_DATABASE_URN = module.databases.dev_staging_mysql_urn
  DEV_STAGING_REDIS_DATABASE_URN = module.databases.dev_staging_redis_urn
  PRODUCTION_MYSQL_DATABASE_URN  = module.databases.production_mysql_urn
  PRODUCTION_REDIS_DATABASE_URN  = module.databases.production_redis_urn
  DEV_STAGING_DROPLET_URN        = module.droplets.dev_staging_urn
  PRODUCTION_DROPLET_URN         = module.droplets.production_urn
  PRODUCTION_DOMAIN_URN          = module.domains.production_domain_urn
  DEV_STAGING_SPACE_URN          = module.spaces.dev_staging_urn
  PRODUCTION_SPACE_URN           = module.spaces.production_urn
  PROJECT_DESCRIPTION            = var.PROJECT_DESCRIPTION
  STAGING_DOMAIN_URN             = module.domains.staging_domain_urn
  DEV_DOMAIN_URN                 = module.domains.dev_domain_urn
  PROJECT_NAME                   = var.PROJECT_NAME
  source                         = "./modules/project/"
}

module "droplets" {
  CREATE_NON_PRODUCTION_RESOURCES = var.CREATE_NON_PRODUCTION_RESOURCES
  PROJECT_NAME                    = var.PROJECT_NAME
  PASSWORD                        = var.PASSWORD
  REGION                          = var.REGION
  source                          = "./modules/droplets/"
}

module "domains" {
  CREATE_NON_PRODUCTION_RESOURCES = var.CREATE_NON_PRODUCTION_RESOURCES
  DEV_STAGING_IP_ADDRESS          = module.droplets.dev_staging_ipv4
  PRODUCTION_IP_ADDRESS           = module.droplets.production_ipv4
  DOMAIN                          = var.DOMAIN
  source                          = "./modules/domains/"
}

module "databases" {
  CREATE_NON_PRODUCTION_RESOURCES = var.CREATE_NON_PRODUCTION_RESOURCES
  DATABASE_USER_PASSWORD          = var.DATABASE_USER_PASSWORD
  CREATE_DATABASES                = var.CREATE_DATABASES
  DATABASE_USER                   = var.DATABASE_USER
  DATABASE_NAME                   = var.DATABASE_NAME
  PROJECT_NAME                    = var.PROJECT_NAME
  REGION                          = var.REGION
  source                          = "./modules/databases/"
}

module "spaces" {
  CREATE_NON_PRODUCTION_RESOURCES = var.CREATE_NON_PRODUCTION_RESOURCES
  CREATE_SPACES                   = var.CREATE_SPACES
  PROJECT_NAME                    = var.PROJECT_NAME
  DOMAIN_NAME                     = var.DOMAIN_NAME
  DOMAIN                          = var.DOMAIN
  REGION                          = var.REGION
  source                          = "./modules/spaces/"
}
