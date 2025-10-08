// General Variables
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "West Europe"
}

variable "environemt" {
  description = "Environment tag for resources"
  type        = string
  default     = "sandbox"
}

variable "owner" {
  description = "Owner tag for resources"
  type        = string
  default     = "Travis"
}

// Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-travis-sandbox"
}

// App Service Plan
variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "asp-travis-sandbox"
}

variable "app_service_plan_os_type" {
  description = "OS type for the App Service Plan"
  type        = string
  default     = "Windows"
}

variable "app_service_plan_sku" {
  description = "SKU for the App Service Plan"
  type        = string
  default     = "B1"
}

// Web App
variable "web_app_name" {
  description = "Name of the Web App"
  type        = string
  default     = "wwa-travis-sandbox"
}

// Storage Account
variable "storage_account_name" {
  description = "Name of the Stroage Account"
  type        = string
  default     = "asatravissandbox"
}

variable "storage_account_tier" {
  description = "Tier for the Storage Account"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication" {
  description = "Replication Type for the Storage Account"
  type        = string
  default     = "GRS"
}

// Application Insights
variable "app_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "appinsights-travis-sandbox"
}
