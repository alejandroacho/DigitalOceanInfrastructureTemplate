variable "PROJECT_NAME" {
  type = string
}

variable "DATABASE_NAME" {
  type = string
}

variable "DATABASE_USER" {
  type = string
}

variable "DATABASE_USER_PASSWORD" {
  type = string
}

variable "REGION" {
  type = string
}

variable "CREATE_NON_PRODUCTION_RESOURCES" {
  type = bool
  default = false
}

variable "CREATE_DATABASES" {
  type = bool
  default = true
}
