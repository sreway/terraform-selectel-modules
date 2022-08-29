data "openstack_compute_keypair_v2" "key_pair" {
  name = var.instance_key_pair_name
}

module "flavor" {
  source       = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/flavor"
  flavor_name  = var.instance_name
  flavor_vcpus = var.instance_vcpus
  flavor_ram   = var.instance_ram
  flavor_disk  = var.instance_disk
}

resource "openstack_networking_port_v2" "network_port" {
  name       = var.instance_name
  network_id = var.instance_network_id

  fixed_ip {
    subnet_id = var.instance_subnet_id
  }
}

module "datasource_image" {
  source     = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/datasource/image"
  image_name = var.instance_image
}

resource "openstack_compute_instance_v2" "compute_instance" {
  name              = var.instance_name
  image_id          = module.datasource_image.image_id
  flavor_id         = module.flavor.flavor_id
  availability_zone = var.instance_zone
  key_pair          = data.openstack_compute_keypair_v2.key_pair.id

  network {
    port = openstack_networking_port_v2.network_port.id
  }

  lifecycle {
    ignore_changes = [image_id]
  }

  vendor_options {
    ignore_resize_confirmation = true
  }

  tags = var.instance_tags
}

module "remote_volume" {
  source      = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/remote_volume"
  for_each    = var.instance_remote_volumes
  volume_name = each.value.name
  volume_size = each.value.size
  volume_type = each.value.type
  volume_zone = each.value.zone
}

resource "openstack_compute_volume_attach_v2" "remote_volumes" {
  for_each    = module.remote_volume
  instance_id = openstack_compute_instance_v2.compute_instance.id
  volume_id   = each.value.volume_id
}