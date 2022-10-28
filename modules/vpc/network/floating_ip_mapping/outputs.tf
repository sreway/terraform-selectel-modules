output "address" {
  value = data.openstack_networking_floatingip_v2.floating_ip.address
}

output "fixed_ip" {
  value = module.floating_ip.address
}

output "id" {
  value = data.openstack_networking_floatingip_v2.floating_ip.id
}

output "pool" {
  value = data.openstack_networking_floatingip_v2.floating_ip.pool
}

output "port_id" {
  value = var.port_id
}

output "region" {
  value = data.openstack_networking_floatingip_v2.floating_ip.region
}