terraform {
  required_version = ">= 1.5.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.69"
    }
  }
}

# The `provider "proxmox"` block is intentionally NOT declared here. This module
# is consumed via Terragrunt, which generates the provider from
# `iac.homelab-live-infra/_providers/proxmox.hcl` (endpoint + api_token, injected
# from a local tfvars/env). Declaring one here would collide with that.
