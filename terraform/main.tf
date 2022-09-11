terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Get image infos
data "digitalocean_droplet_snapshot" "droplet-snapshot" {
  name_regex  = var.snapshot_name
  region      = var.region
  most_recent = true
}

# Get public key stored on digital ocean
data "digitalocean_ssh_key" "public_key" {
  name = "ssh-key-ansible"
}

resource "digitalocean_droplet" "ubuntu-droplet" {
  image    = data.digitalocean_droplet_snapshot.droplet-snapshot.id
  name     = var.droplet_name
  region   = data.digitalocean_droplet_snapshot.droplet-snapshot.region
  size     = var.size
  ssh_keys = [data.digitalocean_ssh_key.public_key.id]
}

output "ip_server" {
  value = digitalocean_droplet.ubuntu-droplet.ipv4_address
}