data "openstack_compute_instance_v2" "instances" {
  for_each = var.instance_id
  id       = each.value.id
}

data "openstack_networking_floatingip_v2" "floating_ips" {
  for_each = var.floating_ip
  address  = each.value.ip_address
}

locals {
  ansible_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    instances    = data.openstack_compute_instance_v2.instances
    floating_ips = data.openstack_networking_floatingip_v2.floating_ips
    tags         = distinct(flatten([for item in data.openstack_compute_instance_v2.instances : item.tags]))
  })
}