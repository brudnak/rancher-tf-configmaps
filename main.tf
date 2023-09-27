terraform {
  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = "3.1.1"
    }
  }
}

provider "rancher2" {
  # Configuration options
  api_url   = var.rancher_url
  token_key = var.rancher_token
  insecure  = false
}

# Create a new Rancher2 ConfigMap V2
resource "rancher2_config_map_v2" "rancher2_config_map_v2" {
  count      = var.configmap_count
  cluster_id = var.cluster_id
  name       = "foo-tf-configmap-${count.index}"
  namespace  = var.namespace
  data = {
    mydata1 = "<data1>"
    mydata2 = "<data2>"
    mydata3 = "<data3>"
  }
}


variable "rancher_url" {}
variable "rancher_token" {}
variable "cluster_id" {}
variable "namespace" {}
variable "configmap_count" {}
