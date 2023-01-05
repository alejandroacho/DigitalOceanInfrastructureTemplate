locals {
  BUCKET_NAME = "${lower(var.PROJECT_NAME)}-${var.DOMAIN_NAME}-${var.REGION}-bucket"
}
