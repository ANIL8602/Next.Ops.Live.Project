
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}



variable "subnets" {
  description = "Subnet configurations"
  type        = map(list(string))
}



variable "nsg_config" {
  description = "NSG configuration for each subnet"

  type = map(object({
    nsg_name = string

    security_rules = list(object({
      name                   = string
      priority               = number
      protocol               = string
      source_address_prefix  = string
      destination_port_range = string
    }))
  }))
}



variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}


variable "postgresql_server_name" {
  type = string
}

variable "postgresql_database_name" {
  type = string
}

variable "private_dns_zone_name" {
  type = string
}

variable "postgresql_admin_username" {
  type = string
}

variable "postgresql_admin_password" {
  type      = string
  sensitive = true
}

variable "postgresql_sku" {
  type    = string
  default = "B_Standard_B1ms"
}
