resource "openstack_networking_network_v2" "network" {
  name = var.network_name
}

resource "openstack_networking_subnet_v2" "subnet" {
  network_id = openstack_networking_network_v2.network.id
  name = var.subnet_cidr
  cidr = var.subnet_cidr
  enable_dhcp = var.subnet_dhcp
  dns_nameservers = var.subnet_dns_nameservers
}