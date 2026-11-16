
variable "server_name" {
  type        = string
  description = "PostgreSQL server name"
}

variable "database_name" {
  type        = string
  description = "Application database name"
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_network_id" {
  type = string
}

variable "delegated_subnet_id" {
  type = string
}

variable "private_dns_zone_name" {
  type = string
}

variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type      = string
  sensitive = true
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "tags" {
  type    = map(string)
  default = {}
}
