variable "snapshot_name" {
  type    = string
  default = "ubuntu-image"
}

variable "droplet_name" {
  type    = string
  default = "ubuntu-server"
}

variable "region" {
  type = string
  default = "ams3"
}

variable "size" {
  type    = string
  default = "s-1vcpu-1gb"
}