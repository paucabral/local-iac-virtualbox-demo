resource "virtualbox_vm" "node" {
  count     = 1
  name      = var.vm_count == 1 ? var.vm_name : format("${var.vm_name}-%02d", count.index + 1)
  image     = var.image
  cpus      = 2
  memory    = "512 MB"
  user_data = var.user_data

  network_adapter {
    type           = var.network_adapter_type
    host_interface = var.network_host_interface
  }
}