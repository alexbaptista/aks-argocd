data "kubectl_file_documents" "argocd_namespace" {
  content = file("manifests/${var.argocd_settings["version"]}/namespace.yaml")
}

data "kubectl_file_documents" "argocd" {
  content = file("manifests/${var.argocd_settings["version"]}/install.yaml")
}