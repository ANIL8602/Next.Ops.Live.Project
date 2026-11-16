variable "resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
variable "tags" {
  description = "Resource Group tags"
  type        = map(string)
  default     = {}
}