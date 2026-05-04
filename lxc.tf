resource "proxmox_virtual_environment_container" "lxc_container" {
  node_name   = var.proxmox_node
  vm_id       = var.lxc_vmid_start
  description = "${var.lxc_description} — ${local.runner_name}"
  tags        = var.lxc_tags

  start_on_boot = true
  started       = true

  operating_system {
    template_file_id = var.lxc_template
    type             = "ubuntu"
  }

  initialization {
    hostname = "${local.runner_name}"

    dns {
      domain  = var.dns_domain
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.lxc_static_ip
        gateway = var.proxmox_network_gateway
      }
    }

    user_account {
      keys     = [var.ssh_public_key]
      password = var.root_password
    }
  }

  network_interface {
    name   = var.proxmox_network_interface_name
    bridge = var.proxmox_network_bridge
  }

  cpu {
    cores = var.lxc_cpu_cores
  }

  memory {
    dedicated = var.lxc_memory_mb
    swap      = var.lxc_swap_mb
  }

  disk {
    datastore_id = var.lxc_storage_pool
    size         = var.lxc_disk_size_gb
  }

  features {
    nesting = true
  }
}
