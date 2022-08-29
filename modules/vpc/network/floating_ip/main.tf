resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "external-network"
}

resource "openstack_networking_floatingip_associate_v2" "association" {
  port_id = var.port_id
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
}