resource "azurerm_key_vault_secret" "argocd" {
  name            = var.keyvault_argocd_name
  value           = data.kubernetes_secret.argocd_admin.data["password"]
  key_vault_id    = azurerm_key_vault.default.id
  expiration_date = var.keyvault_argocd_settings.expiration_date
  content_type    = var.keyvault_argocd_settings.content_type
}