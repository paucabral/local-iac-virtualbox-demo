# output "instance_name" {
#   value = virtualbox_vm.node.*.name
# }

# output "ip_address" {
#   value = virtualbox_vm.node.*.network_adapter.0.ipv4_address
# }

locals {
  db_instance_names = virtualbox_vm.db_node.*.name
  db_ip_addresses = virtualbox_vm.db_node.*.network_adapter.0.ipv4_address
  app_instance_names = virtualbox_vm.app_node.*.name
  app_ip_addresses = virtualbox_vm.app_node.*.network_adapter.0.ipv4_address
}

output "db_instance_ip" {
  value = [
    for idx, instance in local.db_instance_names :
    "${instance}: ${local.db_ip_addresses[idx]}"
  ]
}

output "app_instance_ip" {
  value = [
    for idx, instance in local.app_instance_names :
    "${instance}: ${local.app_ip_addresses[idx]}"
  ]
}