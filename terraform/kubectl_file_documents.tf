data "kubectl_file_documents" "argocd_namespace" {
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/namespace.yaml")
  depends_on = [
    azurerm_kubernetes_cluster.default,
  ]
}

data "kubectl_file_documents" "argocd" {
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/install.yaml")
  depends_on = [
    azurerm_kubernetes_cluster.default,
  ]
}