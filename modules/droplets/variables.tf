variable "PROJECT_NAME" {
  type = string
}

variable "REGION" {
  type = string
}

variable "CREATE_NON_PRODUCTION_RESOURCES" {
  type = bool
  default = false
}

variable "PASSWORD" {
  type = string
}