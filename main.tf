terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.0"
    }
  }
}

locals {
  default_tags = {
    ManagedBy = "Terraform"
    Project   = var.prefix
  }
}

# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = local.default_tags
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "this" {
  name                = "${var.prefix}-network"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = var.address_space
  tags                = local.default_tags
}


resource "azurerm_subnet" "this" {
  count                = var.create_vm ? 1 : 0
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "this" {
  count               = var.create_vm ? 1 : 0
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = local.default_tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.this[0].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  count               = var.create_vm ? 1 : 0
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.this[0].id,
  ]
  tags = local.default_tags
  #   admin_ssh_key {
  #     username   = "adminuser"
  #     public_key = file("~/.ssh/id_rsa.pub")
  #   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_storage_account" "this" {
  count                    = var.create_storage ? 1 : 0
  name                     = "${var.prefix}-storage-account"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.default_tags
}

resource "azurerm_storage_container" "this" {
  count                 = var.create_storage ? 1 : 0
  name                  = "${var.prefix}-storage-container"
  storage_account_id    = azurerm_storage_account.this[0].id
  container_access_type = var.container_access_type

}