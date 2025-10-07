resource "azurerm_resource_group" "resource_group" {
    name = "Travis"
    location = "West Europe"
    tags = {
      environment = "sandbox"
      owner = "Travis"
    }
}

resource "azurerm_service_plan" "service_plan" {
  name = "asp-travis-sandbox"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  os_type = "Windows"
  sku_name = "B1"

  tags = {
    environment = "sandbox"
    owner = "Travis"
  }
}