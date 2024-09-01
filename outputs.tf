# output "instance_name" {
#   value = virtualbox_vm.node.*.name
# }

# output "ip_address" {
#   value = virtualbox_vm.node.*.network_adapter.0.ipv4_address
# }

locals {
  instance_names = virtualbox_vm.node.*.name
  ip_addresses = virtualbox_vm.node.*.network_adapter.0.ipv4_address
}

output "instance_ip" {
  value = [
    for idx, instance in local.instance_names :
    "${instance}: ${local.ip_addresses[idx]}"
  ]
}