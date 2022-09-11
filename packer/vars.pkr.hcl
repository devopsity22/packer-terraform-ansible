variable "droplet_name" {
  description = "Name of my droplet"
  type        = string
  default     = "ubuntu-server-test"
}

variable "image" {
  description = "Image created with packer"
  type        = string
  default     = "ubuntu-20-04-x64"
}

variable "region" {
  description = "Desired region"
  type        = string
  default     = "ams3"
}

variable "size" {
  description = "Desired cpu and ram size"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "snapshot_name" {
  description = "Name of snapshot"
  type        = string
  default     = "ubuntu-image"
}

variable "ssh_username" {
  description = "Digital ocean default user"
  type        = string
  default     = "root"
}

variable "remote_user" {
  description = "Non root user to be created on digital ocean"
  type        = string
  default     = "ubuntu"
}

variable "local_user" {
  description = "Local username of the host"
  type        = string
  default     = "mdifils"
}