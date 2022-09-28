variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region for resources"
}

variable "resourcegroup_name" {
  type        = string
  default     = "resourcegroup-aks"
  description = "Resource Group name"
}

variable "log_analytics_name" {
  type        = string
  default     = "log-aks"
  description = "Log Analytics name"
}

variable "log_analytics_settings" {
  type = object({
    retention_in_days = number
    sku               = string
  })
  default = {
    retention_in_days = 30
    sku               = "PerGB2018"
  }
  description = "Log Analytics settings"
}

variable "aks_name" {
  type        = string
  default     = "infra-aks"
  description = "AKS Cluster name"
}

variable "aks_default_node" {
  type = object({
    name            = string
    node_count      = number
    os_disk_size_gb = number
    vm_size         = string
  })
  default = {
    name            = "default"
    node_count      = 1
    os_disk_size_gb = 30
    vm_size         = "Standard_D2_v2"
  }
  description = "Settings for AKS Node Cluster"
}

variable "aks_settings" {
  type = object({
    api_server_authorized_ip_ranges = list(string)
    azure_policy_enabled            = bool
    dns_prefix                      = string
    identity = object({
      type = string
    })
    network_profile = object({
      network_policy = string
      network_plugin = string
    })
    oms_agent = object({
      log_analytics_workspace_id = string
    })
    role_based_access_control_enabled = bool
  })
  default = {
    api_server_authorized_ip_ranges = ["177.33.139.44/32"]
    azure_policy_enabled            = true
    dns_prefix                      = "k8s"
    identity = {
      type = "SystemAssigned"
    }
    network_profile = {
      network_plugin = "kubenet"
      network_policy = "calico"
    }
    oms_agent = {
      log_analytics_workspace_id = "3a00c7dd-5a70-4a82-9903-d7dd1d8adce3"
    }
    role_based_access_control_enabled = true
  }
  description = "Settings for AKS Cluster"
}

variable "argocd_settings" {
  type = map(string)
  default = {
    "override_namespace" = "argocd"
    "version"            = "v2.4.12"
  }
}

variable "tags" {
  type = map(string)
  default = {
    "Repository"   = "https://github.com/alexbaptista/azuredevops-iac-template-pipeline"
    "Environment"  = "Infra"
    "MaintainedBy" = "Terraform"
  }
  description = "Relation from TAGS to include in resources"
}