provider "proxmox" {
  endpoint  = "https://10.0.10.4:8006/"
  api_token = var.pve_api_token
  insecure  = true
}

data "proxmox_virtual_environment_nodes" "all" {}

output "nodes" {
  value = data.proxmox_virtual_environment_nodes.all.names
}

