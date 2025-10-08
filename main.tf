// This block creates a Resource Group in Azure.
// A Resource Group is a container that holds related resources for an Azure solution.
// It is needed to organize and manage resources like web apps, databases, and networks.
resource "azurerm_resource_group" "resource_group" {
    name     = "Travis"
    location = "West Europe"
    tags = {
      environment = "sandbox"
      owner       = "Travis"
    }
}

// This block creates an App Service Plan.
// An App Service Plan defines the region, operating system, and pricing tier for your web apps.
// It is required to host web apps in Azure.
resource "azurerm_service_plan" "service_plan" {
  name                = "asp-travis-sandbox"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = "Windows" // Specifies the OS for the web app (Windows or Linux)
  sku_name            = "B1"      // Pricing tier (B1 is a basic tier)

  tags = {
    environment = "sandbox"
    owner       = "Travis"
  }
}

// This block creates a Windows Web App.
// A Web App is a managed platform for hosting web applications.
// It runs on the App Service Plan defined above and is placed in the Resource Group.
// The configuration includes HTTPS-only access, always-on, and system-assigned identity.
resource "azurerm_windows_web_app" "win_web_app" {
  name                = "wwa-travis-sandbox"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  https_only          = true // Forces HTTPS connections only

  site_config {
    always_on  = true         // Keeps the app always running
    ftps_state = "Disabled"   // Disables FTP/FTPS access
  }

  identity {
    type = "SystemAssigned"   // Enables a managed identity for the app
  }

  app_settings = {
    "APP_ENV" = "sandbox"     // Application setting for environment
  }

  tags = {
    environment = "sandbox"
    owner       = "Travis"
  }
}

// This Resource block will create a storage account
// A storage account is needed for storing information like: logs, user-uploaded files or static assests
resource "azurerm_storage_account" "storage_account" {
  name = "asastoragetravissandbox"
  resource_group_name = azurerm_resource_group.resource_group.name
  location = azurerm_resource_group.resource_group.location
  account_tier = "Standard"
  account_replication_type = "GRS"
  
  account_kind = "StorageV2"
  access_tier = "Cool"


  tags = {
    environment = "sandbox"
    owner = "Travis"
  }
}