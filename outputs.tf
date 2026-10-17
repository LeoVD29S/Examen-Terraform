output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "app_service_plan_name" {
  value = azurerm_service_plan.asp.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.web.name
}

output "web_app_url" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.app.name
}

output "subnet_prefix" {
  value = azurerm_subnet.app.address_prefixes
}
