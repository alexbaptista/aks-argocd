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
  host                   = azurerm_kubernetes_cluster.default.kube_config.*.host
  username               = azurerm_kubernetes_cluster.default.kube_config.*.username
  password               = azurerm_kubernetes_cluster.default.kube_config.*.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config.*.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config.*.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config.*.cluster_ca_certificate)
}