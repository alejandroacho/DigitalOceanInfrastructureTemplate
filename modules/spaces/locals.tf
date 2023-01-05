locals {
  PRODUCTION_BUCKET_NAME = "production-${lower(var.PROJECT_NAME)}-${var.DOMAIN_NAME}-${var.REGION}-bucket"
  DEV_STAGING_BUCKET_NAME = "dev-staging-${lower(var.PROJECT_NAME)}-${var.DOMAIN_NAME}-${var.REGION}-bucket"
}
