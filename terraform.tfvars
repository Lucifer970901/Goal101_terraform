# Provider configuration details
current_user_ocid    = "ocid1.user.oc1..aaaaaaaar4k64wv2cedlvjpncolow2jlwnat5x6wna5b4sxbyx4rlik2odhq"
home_region          = "ap-mumbai-1"
region               = "ap-hyderabad-1"
tenancy_ocid         = "ocid1.tenancy.oc1..aaaaaaaayn6s77e3y4hgz56uzwvay3jrpekafo6ycr5pr5xdsg3gahcygx7a"
api_fingerprint      = "2f:0c:eb:9a:c0:0d:9b:8b:fe:11:f3:54:84:45:0f:45"
api_private_key_path = "/Users/santhsun/keys/san_demo.pem"
home_compartment_id  = "ocid1.compartment.oc1..aaaaaaaalvchalwelsyiy5au2mvmc575ribho6yon3etj6o7rbo5uthiqg2q"

#nginx-ingress main.tfvars

helm-release-name-nginx-ingress = "nginx-ingress-controller"
helm-repository-nginx-ingress   = null
chart-name-nginx-ingress        = "./g101-helm-charts/ingress-nginx"
chart-version-nginx-ingress     = null
create-namespace-nginx-ingress  = true
namespace-nginx-ingress         = "ingress"
filename-nginx-ingress          = "./g101-helm-charts/ingress-nginx/values-automation.yaml"
dynamic-values-nginx-ingress    = null
