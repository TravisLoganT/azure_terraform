// Web App URL
output "web_app_url" {
  description = "The default URL of the deployed web app"
  value       = azurerm_windows_web_app.win_web_app.default_hostname
}

// Storage Account Name
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage_account.name
}

// Application Insights Instrumentation Key
output "instrumentation_key" {
  description = "Instrumentation key for Applications Insights"
  value       = azurerm_application_insights.application_insights
  sensitive   = true
}

// Application Insights App ID
output "app_insights_app_id" {
  description = "App ID for Application Insights"
  value       = azurerm_application_insights.application_insights.app_id
}
