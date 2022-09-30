data "kubectl_file_documents" "argocd_namespace" {
  depends_on = [
    azurerm_kubernetes_cluster.default,
  ]
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/namespace.yaml")
}

data "kubectl_file_documents" "argocd" {
  depends_on = [
    azurerm_kubernetes_cluster.default,
  ]
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/install.yaml")
}