terraform {
  required_version = ">= 1.0.8"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = var.chart_repo_url
  chart      = "argo-cd"
  namespace  = var.namespace_name
  create_namespace = true
  version    = var.chart_version
  repository_username = var.chart_repo_user
  repository_password = var.chart_repo_token
  values = length(var.helm_values) > 0 ? var.helm_values : ["${file("${path.module}/helm-values.yaml")}"]

  set {
    name = "global.image.tag"
    value = var.image_tag
    type  = "string"
  }

  dynamic "set" {
    for_each = var.extra_set_values
    content {
      name  = set.value.name
      value = set.value.value
      type  = set.value.type
    }
  }
}
