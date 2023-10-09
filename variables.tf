variable "chart_version" {
  description = "argocd chart version"
  default = "5.16.13"
  type        = string
}

variable "image_tag" {
  description = "Version tag of the argocd docker image to use"
  type        = string
  default     = "v2.6.0-rc1"
}

variable "namespace_name" {
  description = "Name for the argocd namespace"
  type        = string
  default     = "argocd"
}

variable "chart_repo_url" {
  description = "URL to repository containing the argocd helm chart"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "chart_repo_user" {
  description = "helm repository username"
  type        = string
}

variable "chart_repo_token" {
  description = "helm repository token"
  type        = string
  sensitive   = true
}

variable "helm_values" {
  description = "Values for argocd Helm chart in raw YAML"
  type        = list(string)
  default     = []
}

variable "extra_set_values" {
  description = "Specific values to override in the argocd Helm chart (overrides corresponding values in the helm-value.yaml file within the module)"
  type = list(object({
    name  = string
    value = any
    type  = string
    })
  )
  default = []
}
