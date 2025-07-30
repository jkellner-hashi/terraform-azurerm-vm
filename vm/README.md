<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.37.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/network_interface) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/storage_container) | resource |
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/4.37.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | IP Range(s) to use for virtual network address space | `list(string)` | <pre>[<br/>  "10.0.0.0/16"<br/>]</pre> | no |
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | Container access type | `string` | `"private"` | no |
| <a name="input_create_storage"></a> [create\_storage](#input\_create\_storage) | True to create storage account and container, false to ignore | `bool` | `null` | no |
| <a name="input_create_vm"></a> [create\_vm](#input\_create\_vm) | True to create VM, false to ignore | `bool` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region location for resources | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for resource naming | `string` | `null` | no |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID | `string` | `null` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure tenant ID | `string` | `null` | no |
<!-- END_TF_DOCS -->