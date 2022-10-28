output "instances" {
  value = [for _, instance in data.openstack_compute_instance_v2.instances: instance.name]
}