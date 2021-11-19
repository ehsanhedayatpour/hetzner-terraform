[kube_control_plane]
%{ for index, ip in master_addresses ~}
master-${index + 1} node_name=master-${index +1} ansible_host=${ip}
%{ endfor ~}

[kube_node]
%{ for index, ip in worker_addresses ~}
worker-${index + 1} node_name=worker-${index +1} ansible_host=${ip}
%{ endfor ~}

[k8s_cluster:children]
kube_node
kube_control_plane
