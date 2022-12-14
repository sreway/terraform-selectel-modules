output "id" {
  value = openstack_compute_instance_v2.compute_instance.id
}

output "name" {
  value = openstack_compute_instance_v2.compute_instance.name
}

output "region" {
  value = openstack_compute_instance_v2.compute_instance.region
}

output "metadata" {
  value = openstack_compute_instance_v2.compute_instance.metadata
}

output "port_id" {
  value = openstack_networking_port_v2.network_port.id
}

output "access_ip_v4" {
  value = openstack_compute_instance_v2.compute_instance.access_ip_v4
}

output "tags" {
  value = openstack_compute_instance_v2.compute_instance.all_tags
}

output "remote_volumes" {
  value = module.remote_volume
}