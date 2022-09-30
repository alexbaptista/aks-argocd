data "terraform_remote_state" "aks" {
  backend = "azurerm" 
  config = {
    storage_account_name  = "terraformalxbap"
    container_name        = "aks-argocd"
    workspaces = "dev"
    key                   = "terraform.tfstate"
  }
}