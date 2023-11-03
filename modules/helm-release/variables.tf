variable "helm-release-name" {
  type = string
  description = "helm-chart-release-name"
}

variable "helm-repository" {
  type = string
  description = "repository of the helm-chart"
}

variable "chart-name" {
  type = string
}

variable "chart-version" {
  type = string
}

variable "create-namespace" {
  type = bool
}

variable "namespace" {
  type = string
}

variable "filename" {
  type = string
}



variable "dynamic-values" {
  type = map(object({
    name  = any
    value = any
  }))
}

variable "runtime-values" {
  type = map(object({
    name  = string
    value = any
  }))
}


# variable "nodeSelector" {
#   type = string
# }

variable "secretName" {
  type = string
}

variable "hosts" {
  type = string
}



