data "terraform_remote_state" "aks" {
  backend   = "azurerm"
  workspace = "dev"
  config = {
    storage_account_name = "terraformalxbap"
    container_name       = "aks"
    key                  = "terraform.tfstate"
  }
}