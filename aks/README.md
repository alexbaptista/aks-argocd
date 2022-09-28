## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.24.0/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_default_node"></a> [aks\_default\_node](#input\_aks\_default\_node) | Settings for AKS Node Cluster | <pre>object({<br>    name            = string<br>    node_count      = number<br>    os_disk_size_gb = number<br>    vm_size         = string<br>  })</pre> | <pre>{<br>  "name": "default",<br>  "node_count": 1,<br>  "os_disk_size_gb": 30,<br>  "vm_size": "Standard_D2_v2"<br>}</pre> | no |
| <a name="input_aks_name"></a> [aks\_name](#input\_aks\_name) | AKS Cluster name | `string` | `"infra-aks"` | no |
| <a name="input_aks_settings"></a> [aks\_settings](#input\_aks\_settings) | Settings for AKS Cluster | <pre>object({<br>    api_server_authorized_ip_ranges = list(string)<br>    azure_policy_enabled            = bool<br>    dns_prefix                      = string<br>    identity = object({<br>      type = string<br>    })<br>    network_profile = object({<br>      network_policy = string<br>      network_plugin = string<br>    })<br>    oms_agent = object({<br>      log_analytics_workspace_id = string<br>    })<br>    role_based_access_control_enabled = bool<br>  })</pre> | <pre>{<br>  "api_server_authorized_ip_ranges": [<br>    "177.33.139.44/32"<br>  ],<br>  "azure_policy_enabled": true,<br>  "dns_prefix": "k8s",<br>  "identity": {<br>    "type": "SystemAssigned"<br>  },<br>  "network_profile": {<br>    "network_plugin": "kubenet",<br>    "network_policy": "calico"<br>  },<br>  "oms_agent": {<br>    "log_analytics_workspace_id": "3a00c7dd-5a70-4a82-9903-d7dd1d8adce3"<br>  },<br>  "role_based_access_control_enabled": true<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for resources | `string` | `"East US"` | no |
| <a name="input_resourcegroup_name"></a> [resourcegroup\_name](#input\_resourcegroup\_name) | Resource Group name | `string` | `"resourcegroup-aks"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Relation from TAGS to include in resources | `map(string)` | <pre>{<br>  "Environment": "Infra",<br>  "MaintainedBy": "Terraform",<br>  "Repository": "https://github.com/alexbaptista/azuredevops-iac-template-pipeline"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | AKS Client certificate |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | AKS Client Key |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | AKS Password |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | AKS User name |
| <a name="output_host"></a> [host](#output\_host) | AKS Host |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | AKS Config raw |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | Name of AKS Cluster |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of resource group |
