# Proxmox provider auth (endpoint / token / insecure) is NOT declared here —
# it comes from the Terragrunt-generated provider
# (iac.homelab-live-infra/_providers/proxmox.hcl). See providers.tf.

variable "proxmox_node" {
  description = "Proxmox node name where the LXC will be created"
  type        = string
  default     = "proxmox"
}

variable "lxc_description" {
  description = ""
  type        = string
}

variable "lxc_tags" {
  description = ""
  default     = [""]
  type        = list(string)
}

variable "lxc_vmid_start" {
  description = "ID for the LXC container"
  type        = number
  default     = 300
}

variable "lxc_template" {
  description = "Proxmox Ubuntu LXC template (e.g., local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst)"
  type        = string
}

variable "lxc_cpu_cores" {
  description = "Number of CPU cores for the container"
  type        = number
  default     = 2
}

variable "lxc_memory_mb" {
  description = "RAM in MB"
  type        = number
  default     = 2048
}

variable "lxc_swap_mb" {
  description = "Swap size in MB"
  type        = number
  default     = 512
}

variable "lxc_disk_size_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 20
}

variable "lxc_storage_pool" {
  description = "Proxmox storage pool (e.g., local-lvm, local-zfs)"
  type        = string
  default     = "containers-thin"
}

variable "proxmox_network_bridge" {
  description = "Proxmox network bridge"
  type        = string
  default     = "vmbr0"
}

variable "lxc_static_ip" {
  description = "Container static IP address"
  type        = string
  default     = ""
}

variable "proxmox_network_gateway" {
  description = "Network gateway"
  type        = string
  default     = ""
}

variable "proxmox_network_interface_name" {
  description = ""
  type        = string
  default     = "eth0"
}

variable "dns_domain" {
  description = "DNS domain"
  type        = string
  default     = "local"
}

variable "dns_servers" {
  description = "DNS servers"
  type        = list(string)
  default     = ["1.1.1.1", "8.8.8.8"]
}

variable "ssh_public_key" {
  description = "SSH public key for container access"
  type        = string
}

variable "ssh_private_key" {
  description = "SSH private key (for the remote-exec provisioner)"
  type        = string
  sensitive   = true
}

variable "root_password" {
  description = "Root password for the container"
  type        = string
  sensitive   = true
}

variable "lxc_base_name" {
  description = "Base name for the runner"
  type        = string
  default     = "proxmox-runner"
}

variable "lxc_purpose" {
  description = "Purpose of the runner"
  type        = string
  default     = "docker-build"
}

variable "lxc_provision_script_path" {
  description = "Script for post creation"
  type        = string
  default     = null
}

