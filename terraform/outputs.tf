output "argocd_admin_password" {
  value       = data.kubernetes_secret.argocd_admin
  description = "ArgoCD Admin Password"
  sensitive   = true
}