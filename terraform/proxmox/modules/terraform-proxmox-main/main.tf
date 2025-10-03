terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}


provider "proxmox" {
  # pm_debug = true
  # pm_tls_insecure = true

  pm_api_url = "https://192.168.8.242:8006/api2/json"


  # api token id is in the form of: <username>@pam!<tokenId>
  #pm_api_token_id = "blog_example@pam!new_token_id"
  # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
  # pm_api_token_secret = "9ec8e608-d834-4ce5-91d2-15dd59f9a8c1"
  #export PM_API_TOKEN_ID='tera@pam!new_token_id'
  #export PM_API_TOKEN_SECRET="21553b62-e14c-4341-86e8-a220a1a74d53"
  # leave tls_insecure set to true unless you have your proxmox SSL certificate situation fully sorted out (if you do, you will know)
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "firewall" {
  name        = "OPNsenseFW"
  description = "OPNsense Firewall"
  target_node = "proxmox"
  os_type     = "Linux"
  cores       = 2
  sockets     = 1
  memory      = 2048
  scsihw      = "virtio-scsi-single"
  bootdisk    = "scsi0"

  # Recommended settings
  onboot = true
  agent  = 0
  boot   = "order=ide2;scsi0"

  disk {
    slot    = "scsi0"
    size    = "10G"
    type    = "disk"
    storage = "local-lvm"
    discard = true
  }

  disk {
    slot    = "ide2"
    type    = "cdrom"
    storage = "local"
    iso     = "local:iso/OPNsense-25.7-dvd-amd64.iso"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
