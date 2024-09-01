variable "vm_name" {
  type        = string
  description = "VM Name"
}

variable "vm_count" {
  type        = number
  description = "VM Count"
  default = 1
}


variable "image" {
  type        = string
  description = "Vagrant Image"
}

variable "cpus" {
  type        = number
  description = "vCPU Count"
  default = 2
}

variable "memory" {
  type        = string
  description = "Memory Size"
  default = "512 MB"
}

variable "user_data" {
  type        = string
  description = "User Data"
  default = null
}

variable "network_adapter_type" {
  type        = string
  description = "Network Adapter Type"
  default = "hostonly"
}

variable "network_host_interface" {
  type        = string
  description = "Network Host Interface"
  default = "vboxnet0"
}