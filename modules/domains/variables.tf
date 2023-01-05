variable "DOMAIN" {
  type = string
}

variable "PRODUCTION_IP_ADDRESS" {
  type = string
}

variable "DEV_STAGING_IP_ADDRESS" {
  type = string
}

variable "CREATE_NON_PRODUCTION_RESOURCES" {
  type = bool
  default = false
}
