# -----------------------------------------------------------------------------
# Provider Requirements if using stack as a module
# -----------------------------------------------------------------------------
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    oci = {
      source                = "oracle/oci"
      version               = "5.1.0" # October 05, 2022 Release
      configuration_aliases = [oci, oci.region]
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.1"
    }
  }
}


# # -----------------------------------------------------------------------------
# # Provider blocks for home region and alternate region(s)
# # -----------------------------------------------------------------------------
provider "oci" {

  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.current_user_ocid
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.home_region
}

provider "oci" {
  alias            = "region"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.current_user_ocid
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
  region           = var.region
}


# # -----------------------------------------------------------------------------
# # Provider Variables
# # -----------------------------------------------------------------------------
variable "current_user_ocid" {
  type        = string
  description = "The OCID of the current user"
  #   default     = ""
}

variable "api_fingerprint" {
  type        = string
  description = "The fingerprint of API"
  #   default     = ""
}

variable "api_private_key_path" {
  type        = string
  description = "The local path to the API private key"
  #   default     = ""
}

variable "tenancy_ocid" {}
variable "home_region" {}