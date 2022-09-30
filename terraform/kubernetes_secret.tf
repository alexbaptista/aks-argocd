# data "kubernetes_secret" "argocd_admin" {
#   metadata {
#     name      = var.argocd_settings["secret_admin"]
#     namespace = var.argocd_settings["namespace"]
#   }
#   depends_on = [
#     kubectl_manifest.argocd
#   ]
# }