variable "external_network_name" {
  type        = string
  default     = "external-network"
  description = "OpenStack networking external network reference"
}

variable "router_name" {
  type        = string
  default     = "router_1"
  description = "OpenStack networking router name"
}

variable "subnet_id" {
  type        = string
  description = "OpenStack networking subnet ID"
}
