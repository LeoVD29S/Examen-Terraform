resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  tags                = local.common_tags
}

resource "azurerm_subnet" "app" {
  name                 = local.snet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]

  # Requerido para VNet Integration de App Service
  delegation {
    name = "delegation-app-service"

    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

resource "azurerm_service_plan" "asp" {
  name                = local.asp_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = var.asp_sku_name
  tags                = local.common_tags
}

resource "azurerm_linux_web_app" "web" {
  name                      = local.app_name
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  service_plan_id           = azurerm_service_plan.asp.id
  virtual_network_subnet_id = azurerm_subnet.app.id
  https_only                = true

  site_config {
    always_on = false # B1 permite desactivarlo; ahorra en lab

    application_stack {
      node_version = "20-lts"
    }
  }

  tags = local.common_tags
}
