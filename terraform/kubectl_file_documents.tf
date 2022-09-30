data "kubectl_file_documents" "argocd_namespace" {
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/namespace.yaml")
}

data "kubectl_file_documents" "argocd" {
  content = file("../argocd/${var.argocd_settings["version"]}/manifests/install.yaml")
}