resource "helm_release" "nginx" {
  name        = "nginx"
  chart       = "nginx"
  repository  = "/home/ubuntu/RKE-project/rke/nginx"
#   namespace   = "nginx"
#   max_history = 3
#   create_namespace = true
#   wait             = true
#   reset_values     = true
}
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
provider "kubernetes" {
config_path    = "~/.kube/config"
}