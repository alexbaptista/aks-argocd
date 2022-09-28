resource "kubectl_manifest" "argocd_namespace" {
  count              = length(data.kubectl_file_documents.argocd_namespace.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd_namespace.documents, count.index)
  override_namespace = var.argocd_settings["namespace"]
}

resource "kubectl_manifest" "argocd" {
  depends_on = [
    kubectl_manifest.argocd_namespace,
  ]
  count              = length(data.kubectl_file_documents.argocd.documents)
  yaml_body          = element(data.kubectl_file_documents.argocd.documents, count.index)
  override_namespace = var.argocd_settings["namespace"]
}