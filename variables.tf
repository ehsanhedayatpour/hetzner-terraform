variable "hcloud_token" {
  default = "put-your-hetzner-token-here"
}
variable "location" {
  default = "hel1"
}

variable "master_instances" {
  default = "1"
}

variable "worker_instances" {
  default = "3"
}

variable "master_type" {
  default = "cpx11"
}

variable "worker_type" {
  default = "cpx21"
}

variable "os_type" {
  default = "ubuntu-20.04"
}
