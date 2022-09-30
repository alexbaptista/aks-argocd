variable "argocd_settings" {
  type = map(string)
  default = {
    "namespace"    = "argocd"
    "secret_admin" = "argocd-initial-admin-secret"
    "version"      = "v2.4.12"
  }
  description = "ArgoCD Settings"
}

variable "keyvault_argocd_name" {
  type        = string
  default     = "argocd-admin"
  description = "Keyvault name for ArgoCD"
}

variable "keyvault_argocd_settings" {
  type = object({
    content_type    = string
    expiration_date = string
  })
  default = {
    content_type    = "password"
    expiration_date = "2024-12-31T23:59:59Z"
  }
  description = "Keyvault for ArgoCD"
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