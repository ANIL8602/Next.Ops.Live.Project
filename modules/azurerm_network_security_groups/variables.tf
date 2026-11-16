
variable "nsg_name" {
  description = "Network Security Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for NSG association"
  type        = string
}

variable "security_rules" {
  description = "Inbound security rules"
  type = list(object({
    name                   = string
    priority               = number
    protocol               = string
    source_address_prefix  = string
    destination_port_range = string
  }))
  default = []
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
