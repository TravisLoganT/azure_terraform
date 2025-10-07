resource "azurerm_resource_group" "resource_group" {
    name = "Travis"
    location = "West Europe"
    tags = {
      environment = "sandbox"
      owner = "Travis"
    }
}