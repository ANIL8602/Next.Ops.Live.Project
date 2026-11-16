
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Existing Resource Group name"
  type        = string
}

variable "address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "tags" {
  description = "VNet tags"
  type        = map(string)
  default     = {}
}
