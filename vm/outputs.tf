output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "Location of the created resource group"
  value       = azurerm_resource_group.this.location
}

output "resource_group_id" {
  description = "ID of the created resource group"
  value       = azurerm_resource_group.this.id
}

output "virtual_network_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.this.name
}

output "virtual_network_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.this.id
}

output "vm_name" {
  description = "Name of the created virtual machine (if created)"
  value       = var.create_vm ? azurerm_linux_virtual_machine.this[0].name : null
}

output "vm_id" {
  description = "ID of the created virtual machine (if created)"
  value       = var.create_vm ? azurerm_linux_virtual_machine.this[0].id : null
}

output "storage_account_name" {
  description = "Name of the created storage account (if created)"
  value       = var.create_storage ? azurerm_storage_account.this[0].name : null
}

output "storage_account_id" {
  description = "ID of the created storage account (if created)"
  value       = var.create_storage ? azurerm_storage_account.this[0].id : null
}

output "storage_container_name" {
  description = "Name of the created storage container (if created)"
  value       = var.create_storage ? azurerm_storage_container.this[0].name : null
}
