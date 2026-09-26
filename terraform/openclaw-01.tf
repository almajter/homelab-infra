resource "proxmox_virtual_environment_container" "openclaw_01" {
  node_name     = "pve"
  vm_id         = 123
  description   = "OpenClaw gateway. Managed by Terraform (homelab-infra)."
  unprivileged  = true
  start_on_boot = true

  initialization {
    hostname = "openclaw-01"

    ip_config {
      ipv4 {
        address = "10.0.10.23/24"
        gateway = "10.0.10.1"
      }
    }

    dns {
      domain  = "home.arpa"
      servers = ["10.0.10.17"]
    }

    user_account {
      keys = [trimspace(file("~/.ssh/id_rsa.pub"))]
    }
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 4096
    swap      = 0
  }

  disk {
    datastore_id = "local-lvm"
    size         = 10
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  features {
    nesting = true
  }

  operating_system {
    template_file_id = "local:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
    type             = "debian"
  }
}
