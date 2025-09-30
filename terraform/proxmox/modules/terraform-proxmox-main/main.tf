terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "<3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  # Configuration options
}
