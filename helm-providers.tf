data "oci_containerengine_cluster_kube_config" "default" {
  cluster_id = "ocid1.cluster.oc1.ap-mumbai-1.aaaaaaaa3mpefl7scosiheomxo5w2klln3yxb2ftevhmufj35carhrvwjfea"
}

locals {
  oke = yamldecode(data.oci_containerengine_cluster_kube_config.default.content)
}

output "okeserver" {
  value = local.oke.clusters[0].cluster.server
}


provider "helm" {
  kubernetes {
    host                   = local.oke.clusters[0].cluster.server
    cluster_ca_certificate = base64decode(local.oke.clusters[0].cluster.certificate-authority-data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["ce", "cluster", "generate-token", "--cluster-id", "ocid1.cluster.oc1.ap-mumbai-1.aaaaaaaa3mpefl7scosiheomxo5w2klln3yxb2ftevhmufj35carhrvwjfea", "--region", "ap-mumbai-1"]
      command     = "oci"
    }
  }
}

provider "kubernetes" {
  host                   = local.oke.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local.oke.clusters[0].cluster.certificate-authority-data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["ce", "cluster", "generate-token", "--cluster-id", "ocid1.cluster.oc1.ap-mumbai-1.aaaaaaaa3mpefl7scosiheomxo5w2klln3yxb2ftevhmufj35carhrvwjfea", "--region", "ap-mumbai-1"]
    command     = "oci"
  }
}

provider "kubectl" {
  load_config_file       = false
  host                   = local.oke.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local.oke.clusters[0].cluster.certificate-authority-data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["ce", "cluster", "generate-token", "--cluster-id", "ocid1.cluster.oc1.ap-mumbai-1.aaaaaaaa3mpefl7scosiheomxo5w2klln3yxb2ftevhmufj35carhrvwjfea", "--region", "ap-mumbai-1"]
    command     = "oci"
  }
}
