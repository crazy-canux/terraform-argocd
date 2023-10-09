# Deploy and configure the argocd

  This module uses the helm provider to deploy argocd

## Synopsis

    module "argocd" {
      source           = "../../terraform-argocd"
      chart_version    = "5.16.13"
      image_tag        = "v2.6.0-rc1"
      helm_values      = ["${file("${path.module}/helm-values.yaml")}"]
    }
