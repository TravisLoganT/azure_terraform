// This block creates a Resource Group in Azure.
// A Resource Group is a container that holds related resources for an Azure solution.
// It is needed to organize and manage resources like web apps, databases, and networks.
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environemt
    owner       = var.owner
  }
}

// This block creates an App Service Plan.
// An App Service Plan defines the region, operating system, and pricing tier for your web apps.
// It is required to host web apps in Azure.
resource "azurerm_service_plan" "service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.app_service_plan_os_type // Specifies the OS for the web app (Windows or Linux)
  sku_name            = var.app_service_plan_sku     // Pricing tier (B1 is a basic tier)

  tags = {
    environment = var.environemt
    owner       = var.owner
  }
}

// This block creates a Windows Web App.
// A Web App is a managed platform for hosting web applications.
// It runs on the App Service Plan defined above and is placed in the Resource Group.
// The configuration includes HTTPS-only access, always-on, and system-assigned identity.
resource "azurerm_windows_web_app" "win_web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  https_only          = true // Forces HTTPS connections only

  site_config {
    always_on  = true       // Keeps the app always running
    ftps_state = "Disabled" // Disables FTP/FTPS access
  }

  identity {
    type = "SystemAssigned" // Enables a managed identity for the app
  }

  app_settings = {
    "APP_ENV" = var.environemt // Application setting for environment
  }

  tags = {
    environment = var.environemt
    owner       = var.owner
  }
}

// This Resource block will create a storage account
// A storage account is needed for storing information like: logs, user-uploaded files or static assests
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication

  account_kind = "StorageV2"
  access_tier  = "Cool"


  tags = {
    environment = var.environemt
    owner       = var.owner
  }
}

// This Resource block will be for Application Insights
// Application insights can be used for monitoring performance and/or errors in other resources (in this case the web app resource)
resource "azurerm_application_insights" "application_insights" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  tags = {
    environment = var.environemt
    owner       = var.owner
  }
}
