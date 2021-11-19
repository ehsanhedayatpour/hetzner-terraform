output "k8s_master_servers_status" {
  value = {
    for server in hcloud_server.k8s-master :
    server.name => server.status
  }
}
output "k8s_master_servers_ips" {
  value = {
    for server in hcloud_server.k8s-master :
    server.name => server.ipv4_address
  }
}

output "k8s_worker_servers_status" {
  value = {
    for server in hcloud_server.k8s-worker :
    server.name => server.status
  }
}
output "k8s_worker_servers_ips" {
  value = {
    for server in hcloud_server.k8s-worker :
    server.name => server.ipv4_address
  }
}
