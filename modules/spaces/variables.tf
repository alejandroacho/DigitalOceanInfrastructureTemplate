variable "PROJECT_NAME" {
  type = string
}

variable "DOMAIN_NAME" {
  type = string
}

variable "DOMAIN" {
  type = string
}

variable "REGION" {
  type = string
}

variable "CREATE_NON_PRODUCTION_RESOURCES" {
  type = bool
  default = false
}

variable "CREATE_SPACES" {
  type = bool
  default = false
}
