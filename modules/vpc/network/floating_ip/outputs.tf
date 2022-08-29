output "floating_ip" {
  value = openstack_networking_floatingip_associate_v2.association.floating_ip
}

output "port_id" {
  value = openstack_networking_floatingip_associate_v2.association.port_id
}
