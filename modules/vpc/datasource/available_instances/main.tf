data "openstack_networking_port_ids_v2" "available_ports" {
  region = var.region
}

data "openstack_networking_port_v2" "ports" {
  for_each = { for idx, val in data.openstack_networking_port_ids_v2.available_ports.ids : idx => val }
  port_id  = each.value
}

// if compute instance attached to port, device_owner equal compute:SELECTEL_ZONE_NAME 
locals {
  devices_id = { for idx, val in data.openstack_networking_port_v2.ports : idx => { "id" : val.device_id } if startswith(val.device_owner, "compute:${var.region}") }
}

data "openstack_compute_instance_v2" "instances" {
  for_each = local.devices_id
  id       = each.value.id
}