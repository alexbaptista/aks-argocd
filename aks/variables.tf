variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region for resources"
}

variable "aks-name" {
  type        = string
  default     = "infra-aks"
  description = "AKS Cluster name"
}

variable "aks-default-node" {
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

variable "aks-settings" {
  type = object({
    dns_prefix                        = string
    role_based_access_control_enabled = bool
  })
  default = {
    dns_prefix                        = "k8s"
    role_based_access_control_enabled = true
  }
  description = "Settings for AKS Cluster"
}

variable "resourcegroup-name" {
  type        = string
  default     = "resourcegroup-aks"
  description = "Resource Group name"
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