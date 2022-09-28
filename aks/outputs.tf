output "resource_group_name" {
  value       = azurerm_resource_group.default.name
  description = "Name of resource group"
}

output "kubernetes_cluster_name" {
  value       = azurerm_kubernetes_cluster.default.name
  description = "Name of AKS Cluster"
}

output "host" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.host
  description = "AKS Host"
}

output "client_key" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.client_key
  description = "AKS Client Key"
}

output "client_certificate" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.client_certificate
  description = "AKS Client certificate"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.default.kube_config_raw
  sensitive   = true
  description = "AKS Config raw"
}

output "cluster_username" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.username
  description = "AKS User name"
}

output "cluster_password" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.password
  description = "AKS Password"
}