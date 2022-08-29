resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = "external-network"
}