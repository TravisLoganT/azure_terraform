# Azure Terraform Sandbox
This project is a sandbox environment for learning how to use Terraform to provision and manage resources in Microsoft Azure. It demonstrates the basics of Infrastructure as Code (IaC) by deploying a simple web application stack, including a resource group, app service plan, web app, storage account, and Application Insights.

## Table of Contents
- Project Structure
- Prerequisites
- Setup Instructions
- Terraform Workflow
- Resources Deployed
- Learning Resources Used

## Project Structure
```
azure_terraform/
├── main.tf           # Main resource definitions
├── variables.tf      # Input variables for customization
├── outputs.tf        # Output values after deployment
├── provider.tf       # Provider configuration
```


## Prerequisites
- Azure Subscription
- Terraform
- Azure CLI
  
## Terraform Workflow
```terraform init```: Prepares your working directory for use with Terraform.

```terraform plan```: Shows what actions Terraform will take.

```terraform apply```: Applies the changes required to reach the desired state.

```terraform destroy```: Removes all resources created by Terraform.

## Resources Deployed
This sandbox will create the following Azure resources:

- **Resource Group** - Logical container for all other resources.

- **App Service Plan** - Defines the region, OS, and pricing tier for web apps.

- **Windows Web App** - A managed web application hosting environment.

- **Storage Account** - Used for storing files, logs, and other data.

- **Application Insights** - Provides monitoring and diagnostics for the web app.

All resources are tagged with environment and owner information for easy identification.

## Learning Resources I Used

- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Getting Started Guide](https://learn.hashicorp.com/collections/terraform/azure-get-started)
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure/)
