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
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "kubectl" {
  host                   = element(data.terraform_remote_state.aks.outputs.host, 0)
  username               = element(data.terraform_remote_state.aks.outputs.username, 0)
  password               = element(data.terraform_remote_state.aks.outputs.password, 0)
  client_certificate     = base64decode(element(data.terraform_remote_state.aks.outputs.client_certificate, 0))
  client_key             = base64decode(element(data.terraform_remote_state.aks.outputs.client_key, 0))
  cluster_ca_certificate = base64decode(element(data.terraform_remote_state.aks.outputs.cluster_ca_certificate, 0))
  load_config_file       = false
}

provider "kubernetes" {
  host                   = element(data.terraform_remote_state.aks.outputs.host, 0)
  username               = element(data.terraform_remote_state.aks.outputs.username, 0)
  password               = element(data.terraform_remote_state.aks.outputs.password, 0)
  client_certificate     = base64decode(element(data.terraform_remote_state.aks.outputs.client_certificate, 0))
  client_key             = base64decode(element(data.terraform_remote_state.aks.outputs.client_key, 0))
  cluster_ca_certificate = base64decode(element(data.terraform_remote_state.aks.outputs.cluster_ca_certificate, 0))
}