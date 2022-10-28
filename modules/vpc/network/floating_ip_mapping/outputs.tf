output "address" {
  value = data.openstack_networking_floatingip_v2.floating_ip.address
}

output "fixed_ip" {
  value = data.openstack_networking_floatingip_v2.floating_ip.fixed_ip
}

output "id" {
  value = data.openstack_networking_floatingip_v2.floating_ip.id
}

output "pool" {
  value = data.openstack_networking_floatingip_v2.floating_ip.pool
}

output "port_id" {
  value = data.openstack_networking_floatingip_v2.floating_ip.port_id
}

output "region" {
  value = data.openstack_networking_floatingip_v2.floating_ip.region
}