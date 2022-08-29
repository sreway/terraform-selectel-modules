variable "sel_user_name" {
  type        = string
  description = "Name of user for access to Selectel VPC project"
}

variable "sel_user_password" {
  type        = string
  description = "Password of user for access to Selectel VPC project"
}

variable "sel_api_key" {
  type        = string
  description = "Selectel API key. Can be create: https://my.selectel.ru/profile/apikeys"
}

variable "sel_project_name" {
  type        = string
  default     = "sreway"
  description = "Selectel VPC project name"
}

variable "sel_account_id" {
  type        = string
  description = "Selectel account id. (contract number)"
}

variable "sel_auth_url" {
  type        = string
  default     = "https://api.selvpc.ru/identity/v3"
  description = "Auth url of Selectel VPC API."
}

variable "sel_region_name" {
  type        = string
  default     = "ru-3"
  description = "Name of region for Selectel VPC resources"
}

variable "sel_ssh_key_name" {
  type        = string
  default     = "ci"
  description = "The name of the SSH key pair to put on the compute instance. The key pair must already be created in some region and associated with Selectel vpc project"
}

variable "networks" {
  type = map(object({
    name            = string
    subnet_cidr     = string
    router_name     = string
    dns_nameservers = list(string)
    tags            = list(string)
  }))

  default = {
    "oncall-net" = {
      name            = "oncall-net"
      subnet_cidr     = "192.168.1.0/24"
      router_name     = "oncall-router"
      enable_dhcp     = false
      dns_nameservers = ["188.93.16.19", "188.93.17.19"]
      tags            = ["oncall_net"]
    }
  }
  description = "Hash map of Virtual Private Cloud network settings that should be created"
}


variable "instances" {
  type = map(object({
    name               = string
    vcpus              = number
    ram                = number
    disk               = number
    image              = string
    zone               = string
    network_name       = string
    create_floating_ip = bool
    tags               = list(string)
  }))
  default = {
    "oncall" = {
      disk               = 20
      image              = "Ubuntu 22.04 LTS 64-bit"
      name               = "oncall"
      ram                = 1024
      vcpus              = 2
      zone               = "ru-3b"
      network_name       = "oncall-net"
      create_floating_ip = true
      tags               = ["oncall", "docker"]
    }
  }
  description = "Hash map of instances setting that should be created"
}

variable "dns_records" {
  type = map(object({
    name               = string
    domain             = string
    type               = string
    ttl                = number
    link_instance_name = string
    letsencrypt_cert   = bool
  }))

  default = {
    "oncall" = {
      name               = "oncall.sreway.ru"
      domain             = "sreway.ru"
      type               = "A"
      ttl                = 86400
      link_instance_name = "oncall"
      letsencrypt_cert   = true
    },
  }
  description = "Hash map of settings dns records that should be created"
}