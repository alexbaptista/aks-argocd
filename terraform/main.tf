terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.24.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
  backend "azurerm" {
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

provider "kubectl" {
  host                   = element(azurerm_kubernetes_cluster.default.*.host, 0)
  username               = element(azurerm_kubernetes_cluster.default.*.username, 0)
  password               = element(azurerm_kubernetes_cluster.default.*.password, 0)
  client_certificate     = base64decode(element(azurerm_kubernetes_cluster.default.*.client_certificate, 0))
  client_key             = base64decode(element(azurerm_kubernetes_cluster.default.*.client_key, 0))
  cluster_ca_certificate = base64decode(element(azurerm_kubernetes_cluster.default.*.cluster_ca_certificate, 0))
}