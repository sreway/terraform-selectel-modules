
output "address" {
  value = openstack_networking_floatingip_associate_v2.association.floating_ip
}

output "id" {
  value = openstack_networking_floatingip_associate_v2.association.id
}

output "fixed_ip" {
  value = openstack_networking_floatingip_associate_v2.association.fixed_ip
}