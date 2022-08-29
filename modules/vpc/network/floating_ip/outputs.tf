output "floating_ip_id" {
  value = openstack_networking_floatingip_v2.floating_ip.id
}

output "floating_ip_address" {
  value = openstack_networking_floatingip_v2.floating_ip.address
}
