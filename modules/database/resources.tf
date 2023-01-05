terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_database_cluster" "mysql" {
  node_count = 1
  version    = "8"
  engine     = "mysql"
  region     = "${var.REGION}"
  name       = "mysql-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "mysql"]
}

resource "digitalocean_database_cluster" "redis" {
  node_count = 1
  version    = "6"
  engine     = "redis"
  region     = "${var.REGION}"
  name       = "redis-cluster"
  size       = "db-s-1vcpu-1gb"
  tags       = ["${var.PROJECT_NAME}", "redis"]
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = var.DATABASE_NAME
}

resource "digitalocean_database_user" "mysql_user" {
  cluster_id = digitalocean_database_cluster.mysql.id
  name       = var.DATABASE_USER
}
