variable "instances" {
  type = map(object({
    id = string
    access_ip_v4 = string
    tags = set(string)
  }))

  description = "Compute instance data (datasource openstack_compute_instance_v2)"
}

variable "floating_ips" {
  type = map(object({
    address = string
    fixed_ip = string
  }))

  description = "Floating ip address data (datasource openstack_networking_floatingip_v2)"
}