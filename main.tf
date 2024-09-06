resource "virtualbox_vm" "db_node" {
  count     = 1
  name      = "db"
  image     = var.image
  cpus      = 2
  memory    = "1024 MB"
  user_data = var.user_data

  network_adapter {
    type           = var.network_adapter_type
    host_interface = var.network_host_interface
  }

  network_adapter {
    type           = "nat"
    host_interface = "NatNetwork"
  }
}

resource "virtualbox_vm" "app_node" {
  count     = 1
  name      = "app"
  image     = var.image
  cpus      = 2
  memory    = "1024 MB"
  user_data = var.user_data

  network_adapter {
    type           = var.network_adapter_type
    host_interface = var.network_host_interface
  }

  network_adapter {
    type           = "nat"
    host_interface = "NatNetwork"
  }
}