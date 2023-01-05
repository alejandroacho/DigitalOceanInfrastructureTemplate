terraform {
  required_providers {
    digitalocean = {
      source     = "digitalocean/digitalocean"
      version    = "~> 2.0"
    }
  }
}

resource "digitalocean_spaces_bucket" "production_bucket" {
  # only create if CREATE_SPACES is true
  count  = var.CREATE_SPACES ? 1 : 0
  name   = "${local.PRODUCTION_BUCKET_NAME}"
  region = "${var.REGION}"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["https://www.${var.DOMAIN}"]
    max_age_seconds = 3000
  }
}

resource "digitalocean_spaces_bucket" "dev_staging_bucket" {
  # only create if CREATE_SPACES is true
  # only create if CREATE_NON_PRODUCTION_RESOURCES is true
  count  = var.CREATE_NON_PRODUCTION_RESOURCES && var.CREATE_SPACES ? 1 : 0
  name   = "${local.DEV_STAGING_BUCKET_NAME}"
  region = "${var.REGION}"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["https://www.${var.DOMAIN}"]
    max_age_seconds = 3000
  }
}
