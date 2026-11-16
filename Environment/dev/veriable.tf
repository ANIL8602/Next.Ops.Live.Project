
variable "resource_group_name" {
  type        = string
  description = "Development Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tags" {
  type    = map(string)
  default = {}
}
