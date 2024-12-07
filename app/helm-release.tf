resource "helm_release" "nginx" {
  name        = "nginx"
  chart       = "3-tier-app"
  repository  = "."
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