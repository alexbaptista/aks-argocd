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
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.13.1"
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
  host                   = element(azurerm_kubernetes_cluster.default.kube_config.*.host, 0)
  username               = element(azurerm_kubernetes_cluster.default.kube_config.*.username, 0)
  password               = element(azurerm_kubernetes_cluster.default.kube_config.*.password, 0)
  client_certificate     = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.client_certificate, 0))
  client_key             = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.client_key, 0))
  cluster_ca_certificate = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.cluster_ca_certificate, 0))
  load_config_file       = false
}

provider "kubernetes" {
  host                   = element(azurerm_kubernetes_cluster.default.kube_config.*.host, 0)
  username               = element(azurerm_kubernetes_cluster.default.kube_config.*.username, 0)
  password               = element(azurerm_kubernetes_cluster.default.kube_config.*.password, 0)
  client_certificate     = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.client_certificate, 0))
  client_key             = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.client_key, 0))
  cluster_ca_certificate = base64decode(element(azurerm_kubernetes_cluster.default.kube_config.*.cluster_ca_certificate, 0))
}