resource "kubectl_manifest" "argocd_namespace" {
  count              = length(data.kubectl_file_documents.argocd_namespace.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd_namespace.documents, count.index)
  override_namespace = var.argocd_settings["namespace"]
  depends_on = [
    azurerm_kubernetes_cluster.default,
  ]
}

resource "kubectl_manifest" "argocd" {
  count              = length(data.kubectl_file_documents.argocd.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd.documents, count.index)
  override_namespace = var.argocd_settings["namespace"]
  depends_on = [
    azurerm_kubernetes_cluster.default,
    kubectl_manifest.argocd_namespace,
  ]
}