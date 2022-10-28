
module "floating_ip" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/network/floating_ip"
}

resource "openstack_networking_floatingip_associate_v2" "association" {
  port_id     = var.port_id
  floating_ip = module.floating_ip.address
  depends_on = [
    module.floating_ip,
  ]
}