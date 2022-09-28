terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
  backend "azurerm" {
  }
  required_version = ">= 1.2.9"
}

provider "azurerm" {
  features {}
}