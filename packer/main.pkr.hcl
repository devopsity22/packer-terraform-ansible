packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}

source "digitalocean" "droplet_image" {
  region        = var.region
  image         = var.image
  size          = var.size
  droplet_name  = var.droplet_name
  snapshot_name = var.snapshot_name
  ssh_username = var.ssh_username
}

build {
  sources = ["source.digitalocean.droplet_image"]

  provisioner "shell" {
    script = "./bootstrap.sh"
  }

  provisioner "file" {
    source      = "/home/${var.local_user}/.ssh_keys/ansible.pub"
    destination = "/home/${var.remote_user}/.ssh/authorized_keys"
  }

  provisioner "shell" {
    inline = [
      "chmod 600 /home/${var.remote_user}/.ssh/authorized_keys",
      "chmod 755 /home/${var.remote_user}/.ssh",
      "chown -R ${var.remote_user}:${var.remote_user} /home/${var.remote_user}/.ssh/"
    ]
  }
}