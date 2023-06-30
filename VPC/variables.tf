variable "region" {
  description = ""
  type = string
  default = "us-east-1"
}
variable "profile" {
  description = ""
  type = string
  default = "default"
}

variable "vsubnet" {
  description = ""
  type = any
  default = {
    "Pulic Subnet 1" = {
      az   = "us-east-1a"
      cidr = "10.0.1.0/24"

    },
    "Pulic Subnet 2" = {
      az   = "us-east-1b"
      cidr = "10.0.2.0/24"
    }
  }
}
variable "vvpc" {
  description = ""
  type = map
  default = {
    name                 = "VPC01"
    cidr                 = "10.0.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = "true"
    enable_dns_hostnames = "true"
  }

}

variable "vig" {
  description = ""
  type = string
  default = "IG 1"
  
}

variable "vroute_table" {
  description = ""
  type = map
  default = {
    name = "Router table 1"
  }
  
}