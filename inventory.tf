resource "local_file" "inventory_cfg" {
  content = templatefile("${path.module}/templates/inventory.tpl",
    {
      master_addresses = hcloud_server.k8s-master.*.ipv4_address
      worker_addresses = hcloud_server.k8s-worker.*.ipv4_address
    }
  )
  filename = "/opt/kubespray/inventory/hosts.ini"
}
