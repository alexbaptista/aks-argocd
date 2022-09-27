resource "azurerm_kubernetes_cluster" "default" {
  name                              = var.aks-name
  location                          = azurerm_resource_group.default.location
  resource_group_name               = azurerm_resource_group.default.name
  dns_prefix                        = var.aks-settings.dns_prefix
  role_based_access_control_enabled = var.aks-settings.role_based_access_control_enabled
  tags                              = var.tags

  dynamic "default_node_pool" {
    for_each = var.aks-default-node
    content = {
      name            = default_node_pool.value["name"]
      node_count      = default_node_pool.value["node_count"]
      os_disk_size_gb = default_node_pool.value["os_disk_size_gb"]
      vm_size         = default_node_pool.value["vm_size"]
    }
  }

}

resource "azurerm_resource_group" "default" {
  name     = var.resourcegroup-name
  location = var.location
}