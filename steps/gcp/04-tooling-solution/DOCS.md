Buckets deployment
==================

This document explains how to deploy buckets for our app.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.dns-ingress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_config"></a> [allowed\_config](#input\_allowed\_config) | n/a | <pre>list(object({<br/>    ports    = list(string)<br/>    protocol = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "ports": [<br/>      "53"<br/>    ],<br/>    "protocol": "TCP"<br/>  },<br/>  {<br/>    "ports": [<br/>      "53"<br/>    ],<br/>    "protocol": "UDP"<br/>  }<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS --> 
