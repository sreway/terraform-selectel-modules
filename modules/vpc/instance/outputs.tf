output "instance_id" {
  value = openstack_compute_instance_v2.compute_instance.id
}

output "instance_port_id" {
  value = openstack_networking_port_v2.network_port.id
}

output "instance_ip_v4" {
  value = openstack_compute_instance_v2.compute_instance.access_ip_v4
}

output "instance_tags" {
  value = openstack_compute_instance_v2.compute_instance.all_tags
}

output "instance_remote_volumes" {
  value = module.remote_volume
}