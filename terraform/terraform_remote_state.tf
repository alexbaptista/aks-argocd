data "terraform_remote_state" "aks" {
  backend   = "azurerm"
  workspace = "DEV"
  config = {
    storage_account_name = "terraformalxbap"
    container_name       = "aks"
    resource_group_name  = "terraform"
    key                  = "terraform.tfstate"
  }
}