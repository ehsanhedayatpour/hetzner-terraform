# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}

resource "hcloud_server" "k8s-master" {
  count       = var.master_instances
  name        = "master-${count.index + 1}"
  image       = var.os_type
  server_type = var.master_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "k8s-master"
    index = "${count.index + 1}"
  }
  user_data = file("user_data.yml")
}

resource "hcloud_server" "k8s-worker" {
  count       = var.worker_instances
  name        = "worker-${count.index + 1}"
  image       = var.os_type
  server_type = var.worker_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "k8s-worker"
  }
  user_data = file("user_data.yml")
}
