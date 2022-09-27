resource "azurerm_kubernetes_cluster" "default" {
  name                              = var.aks-name
  location                          = azurerm_resource_group.default.location
  resource_group_name               = azurerm_resource_group.default.name
  dns_prefix                        = var.aks-settings.dns_prefix
  features                          = var.aks-settings.features
  role_based_access_control_enabled = var.aks-settings.role_based_access_control_enabled
  default_node_pool                 = var.aks-default-node
  tags                              = var.tags
}

resource "azurerm_resource_group" "default" {
  name     = var.resourcegroup-name
  location = var.location
}