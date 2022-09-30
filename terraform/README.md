## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.24.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.13.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.argocd](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/key_vault_secret) | resource |
| [kubectl_manifest.argocd](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubectl_manifest.argocd_namespace](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |
| [kubectl_file_documents.argocd](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.argocd_namespace](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/data-sources/file_documents) | data source |
| [kubernetes_secret.argocd_admin](https://registry.terraform.io/providers/hashicorp/kubernetes/2.13.1/docs/data-sources/secret) | data source |
| [terraform_remote_state.aks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_settings"></a> [argocd\_settings](#input\_argocd\_settings) | ArgoCD Settings | `map(string)` | <pre>{<br>  "namespace": "argocd",<br>  "secret_admin": "argocd-initial-admin-secret",<br>  "version": "v2.4.12"<br>}</pre> | no |
| <a name="input_keyvault_argocd_name"></a> [keyvault\_argocd\_name](#input\_keyvault\_argocd\_name) | Keyvault name for ArgoCD | `string` | `"argocd-admin"` | no |
| <a name="input_keyvault_argocd_settings"></a> [keyvault\_argocd\_settings](#input\_keyvault\_argocd\_settings) | Keyvault for ArgoCD | <pre>object({<br>    content_type    = string<br>    expiration_date = string<br>  })</pre> | <pre>{<br>  "content_type": "password",<br>  "expiration_date": "2024-12-31T23:59:59Z"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Relation from TAGS to include in resources | `map(string)` | <pre>{<br>  "Environment": "Infra",<br>  "MaintainedBy": "Terraform",<br>  "Repository": "https://github.com/alexbaptista/azuredevops-iac-template-pipeline"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_admin_password"></a> [argocd\_admin\_password](#output\_argocd\_admin\_password) | ArgoCD Admin Password |
