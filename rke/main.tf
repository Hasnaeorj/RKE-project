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
    address          = "3.90.214.89"
    user             = "ubuntu"
    role             = ["controlplane", "etcd"]
    ssh_key_path     = "~/.ssh/id_rsa"
  }

    nodes {
    address          = "52.207.242.9"
    user             = "ubuntu"
    role             = ["worker"]
    ssh_key_path     = "~/.ssh/id_rsa"
  }

    nodes {
    address          = "107.21.87.223"
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