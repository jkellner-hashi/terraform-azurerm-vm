variable "subscription_id" {
  type        = string
  default     = null
  description = "Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  default     = null
  description = "Azure tenant ID"
}

variable "prefix" {
  type        = string
  default     = null
  description = "Prefix for resource naming"

  validation {
    condition     = var.prefix != null && var.prefix != "" && can(regex("^[a-z0-9-]{2,15}$", var.prefix))
    error_message = "Prefix must be 2-15 characters long and contain only lowercase letters, numbers, and hyphens."
  }
}

variable "location" {
  type        = string
  default     = null
  description = "Azure region location for resources"

  validation {
    condition = var.location != null && var.location != "" && contains([
      "eastus", "eastus2", "westus", "westus2", "westus3", "centralus", "northcentralus", "southcentralus",
      "westcentralus", "canadacentral", "canadaeast", "brazilsouth", "northeurope", "westeurope",
      "uksouth", "ukwest", "francecentral", "germanywestcentral", "switzerlandnorth", "norwayeast",
      "eastasia", "southeastasia", "japaneast", "japanwest", "koreacentral", "australiaeast",
      "australiasoutheast", "centralindia", "southindia", "westindia", "uaenorth"
    ], var.location)
    error_message = "Location must be a valid Azure region (e.g., eastus, westus2, northeurope)."
  }
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "IP Range(s) to use for virtual network address space"

  validation {
    condition = length(var.address_space) > 0 && alltrue([
      for cidr in var.address_space : can(cidrhost(cidr, 0))
    ])
    error_message = "Address space must contain at least one valid CIDR block (e.g., 10.0.0.0/16)."
  }
}

variable "create_vm" {
  type        = bool
  default     = null
  description = "True to create VM, false to ignore"

  validation {
    condition     = var.create_vm != null
    error_message = "create_vm must be explicitly set to true or false."
  }
}

variable "create_storage" {
  type        = bool
  default     = null
  description = "True to create storage account and container, false to ignore"

  validation {
    condition     = var.create_storage != null
    error_message = "create_storage must be explicitly set to true or false."
  }
}

variable "container_access_type" {
  type        = string
  default     = "private"
  description = "Container access type"

  validation {
    condition     = contains(["private", "blob", "container"], var.container_access_type)
    error_message = "Container access type must be one of: private, blob, container."
  }
}

variable "tags" {
  type = string
  default = null
  description = "Tags"
}