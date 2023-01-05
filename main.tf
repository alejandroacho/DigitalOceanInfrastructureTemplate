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
  PROJECT_DESCRIPTION = var.PROJECT_DESCRIPTION
  PROJECT_ENVIRONMENT = var.PROJECT_ENVIRONMENT
  MYSQL_DATABASE_URN  = module.database.mysql_urn
  REDIS_DATABASE_URN  = module.database.redis_urn
  PROJECT_NAME        = var.PROJECT_NAME
  DROPLET_URN         = module.droplet.urn
  DOMAIN_URN          = module.domain.urn
  SPACE_URN           = module.space.urn
  source              = "./modules/project/"
}

module "droplet" {
  PROJECT_NAME = var.PROJECT_NAME
  REGION       = var.REGION
  source       = "./modules/droplet/"
}

module "domain" {
  IP_ADDRESS = module.droplet.ipv4
  DOMAIN     = var.DOMAIN
  source     = "./modules/domain/"
}

module "database" {
  DATABASE_USER_PASSWORD = var.DATABASE_USER_PASSWORD
  DATABASE_USER          = var.DATABASE_USER
  DATABASE_NAME          = var.DATABASE_NAME
  PROJECT_NAME           = var.PROJECT_NAME
  REGION                 = var.REGION
  source                 = "./modules/database/"
}

module "space" {
  PROJECT_NAME = var.PROJECT_NAME
  DOMAIN_NAME  = var.DOMAIN_NAME
  DOMAIN       = var.DOMAIN
  REGION       = var.REGION
  source       = "./modules/space/"
}
