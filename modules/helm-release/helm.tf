resource "helm_release" "helm-deployment" {
  name       = var.helm-release-name
  repository = var.helm-repository
  chart      = var.chart-name
  version    = var.chart-version
  create_namespace = var.create-namespace
  repository_key_file        =  null
  repository_cert_file       = null
  repository_ca_file         = null
  repository_username        = null
  repository_password        = null
  force_update  = true
  wait = null
  recreate_pods              = true
  max_history                = 0
  lint                       = true
  cleanup_on_fail            = false
  disable_webhooks           = false
  verify                     = false
  reuse_values               = true
  reset_values               = false
  atomic                     = false
  skip_crds                  = false
  render_subchart_notes      = true
  disable_openapi_validation = false
  wait_for_jobs              = false
  dependency_update          = false
  replace                    = false
  namespace = var.namespace
  values = [
    "${templatefile(var.filename, 
    {
      #  nodeSelector = var.nodeSelector
       secretName = var.secretName
       hosts = var.hosts
  
    }
    )}"
  ]
  dynamic "set" {
    for_each =  var.dynamic-values
    content {
      name  = set.value["name"]  
      value = set.value["value"] 
}   
}
  
  dynamic "set" {
    for_each =  var.runtime-values
        content {
      name  = set.value["name"]
      value = set.value["value"]
}   
}

# lifecycle {
#     create_before_destroy = true
#   }

}