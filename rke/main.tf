terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
      version = ">= 1.0.0"
    }
  }
}
provider "rke" {}



resource "rke_cluster" "cluster" {
  nodes {
    address          = "54.82.35.8"
    user             = "ubuntu"
    role             = ["controlplane", "etcd"]
    ssh_key_path     = "~/.ssh/id_rsa"
  }

    nodes {
    address          = "54.90.88.205"
    user             = "ubuntu"
    role             = ["worker"]
    ssh_key_path     = "~/.ssh/id_rsa"
  }

    nodes {
    address          = "54.173.1.176"
    user             = "ubuntu"
    role             = ["worker"]
    ssh_key_path     = "~/.ssh/id_rsa"
  }


enable_cri_dockerd = true

}

output kube_config {
    sensitive = true
    value = rke_cluster.cluster.kube_config_yaml
}