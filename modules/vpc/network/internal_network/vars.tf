variable "network_name" {
  type        = string
  description = "Name of internal network"
}

variable "subnet_cidr" {
  type        = string
  default     = "192.168.0.0/24"
  description = "Subnet cidr for the internal network"
}

variable "subnet_dhcp" {
  type        = bool
  default     = false
  description = "DHCP capabilities of the subnet"
}

variable "subnet_dns_nameservers" {
  type        = list(string)
  default     = null
  description = "DNS servers of the subnet"
}