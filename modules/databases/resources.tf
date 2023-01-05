terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_database_cluster" "production_mysql" {
  # only create if CREATE_DATABASES is true
  node_count = 1
  version    = "8"
  engine     = "mysql"
  region     = "${var.REGION}"
  count      = var.CREATE_DATABASES ? 1 : 0
  name       = "production-${lower(var.PROJECT_NAME)}-mysql-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "mysql", "production"]
}

resource "digitalocean_database_cluster" "production_redis" {
  # only create if CREATE_DATABASES is true
  node_count = 1
  version    = "6"
  engine     = "redis"
  region     = "${var.REGION}"
  count      = var.CREATE_DATABASES ? 1 : 0
  name       = "production-${lower(var.PROJECT_NAME)}-redis-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "redis", "production"]
}

resource "digitalocean_database_db" "production_database" {
  # only create if CREATE_DATABASES is true
  cluster_id = digitalocean_database_cluster.production_mysql[0].id
  count      = var.CREATE_DATABASES ? 1 : 0
  name       = var.DATABASE_NAME
}

resource "digitalocean_database_user" "production_mysql_user" {
  # only create if CREATE_DATABASES is true
  cluster_id = digitalocean_database_cluster.production_mysql[0].id
  count      = var.CREATE_DATABASES ? 1 : 0
  name       = var.DATABASE_USER
}

resource "digitalocean_database_cluster" "dev_staging_mysql" {
  # only create if CREATE_DATABASES is true
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  node_count = 1
  version    = "8"
  engine     = "mysql"
  region     = "${var.REGION}"
  count      = var.CREATE_DATABASES && var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = "dev-staging-${lower(var.PROJECT_NAME)}-mysql-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "mysql", "dev_staging"]
}

resource "digitalocean_database_cluster" "dev_staging_redis" {
  # only create if CREATE_DATABASES is true
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  node_count = 1
  version    = "6"
  engine     = "redis"
  region     = "${var.REGION}"
  count      = var.CREATE_DATABASES && var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = "dev-staging-${lower(var.PROJECT_NAME)}-redis-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "redis", "dev_staging"]
}

resource "digitalocean_database_db" "dev_staging_database" {
  # only create if CREATE_DATABASES is true
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  cluster_id = digitalocean_database_cluster.dev_staging_mysql[0].id
  count      = var.CREATE_DATABASES && var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = var.DATABASE_NAME
}

resource "digitalocean_database_user" "dev_staging_mysql_user" {
  # only create if CREATE_DATABASES is true
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  cluster_id = digitalocean_database_cluster.dev_staging_mysql[0].id
  count      = var.CREATE_DATABASES && var.CREATE_NON_PRODUCTION_RESOURCES ? 1 : 0
  name       = var.DATABASE_USER
}