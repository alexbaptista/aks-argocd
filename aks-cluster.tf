resource "azurerm_kubernetes_cluster" "default" {
  name                = "infra-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "k8s"
  features            = {}

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    Application  = "Demo"
    Architecture = ""
    Domain       = ""
    Environment  = "Infra"
    MaintainedBy = "Terraform"
  }
}



resource "azurerm_resource_group" "example" {
  name     = "infra-rg"
  location = "East US"
}