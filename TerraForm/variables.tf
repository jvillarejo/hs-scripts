variable "ip_ranges" {
  type = "map"

  default = {
    "de" = "10.13.112.0/21"
    "qa" = "10.13.120.0/21"
    "pr" = "10.13.136.0/21"
  }
}

variable "some_ips" {
  type = "list"

  default = [
    "127.0.0.0/32",
    "192.168.0.0/32",
  ]
}

variable "enabled" {
  default = 0
}

variable "ec2_enabled" {
  default = 1
}

variable "vpc_enabled" {
  default = 1
}

variable "buckets" {
  default = 1
}

variable "prevent_destroy" {
  type    = "string"
  default = "false"
}

variable "cidr" {
  default = "10.35.112.0/21"
}

variable "sshkey" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDUq96zDCVftHlPeNMVTI5R6CSBR0t9nueeol73293PjryEql2pq5YyHRBOrck6AUlB6pspVp6ib6bT0wwdK0ppwoK4BeGeoaTNTP4Hy2xh6JgvoNSbHT3raXyuhuqCZa8o42hxSWalnaUU3VBONO4MXuISD98QI8v7VqbKmhCZ5w== mk@mk3"
}
