resource "azurerm_kubernetes_cluster" "default" {
  name                              = var.aks_name
  location                          = azurerm_resource_group.default.location
  resource_group_name               = azurerm_resource_group.default.name
  dns_prefix                        = var.aks_settings.dns_prefix
  role_based_access_control_enabled = var.aks_settings.role_based_access_control_enabled
  api_server_authorized_ip_ranges   = var.aks_settings.api_server_authorized_ip_ranges
  azure_policy_enabled              = var.aks_settings.azure_policy_enabled
  tags                              = var.tags

  dynamic "default_node_pool" {
    for_each = var.aks_default_node
    content {
      name            = default_node_pool.value["name"]
      node_count      = default_node_pool.value["node_count"]
      os_disk_size_gb = default_node_pool.value["os_disk_size_gb"]
      vm_size         = default_node_pool.value["vm_size"]
    }
  }

  dynamic "network_profile" {
    for_each = var.aks_settings.network_profile
    content {
      network_policy = network_profile.value["network_policy"]
      network_plugin = network_profile.value["network_plugin"]
    }
  }

  dynamic "identity" {
    for_each = var.aks_settings.identity
    content {
      type = identity.value["type"]
    }
  }

  dynamic "oms_agent" {
    for_each = var.aks_settings.oms_agent
    content {
      log_analytics_workspace_id = oms_agent.value["log_analytics_workspace_id"]
    }
  }

}

resource "azurerm_resource_group" "default" {
  name     = var.resourcegroup_name
  location = var.location
}