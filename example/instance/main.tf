provider "openstack" {
  user_name           = var.sel_user_name
  password            = var.sel_user_password
  tenant_name         = var.sel_project_name
  project_domain_name = var.sel_account_id
  user_domain_name    = var.sel_account_id
  auth_url            = var.sel_auth_url
  region              = var.sel_region_name
}

provider "selectel" {
  token = var.sel_api_key
}

// Create networks
module "internal_network" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/network/internal_network"
  for_each = var.networks
  network_name = each.value.name
  subnet_cidr = each.value.subnet_cidr
  subnet_dns_nameservers = each.value.dns_nameservers
}

// Create routers for networks
module "router" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/network/router"
  for_each = module.internal_network
  router_name = var.networks[each.key].router_name
  subnet_id = each.value.subnet_id
  depends_on = [
    module.internal_network
  ]
}

// Create instances
module "instance" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/instance"
  for_each = var.instances
  instance_name = each.value.name
  instance_ram = each.value.ram
  instance_vcpus = each.value.vcpus
  instance_disk = each.value.disk
  instance_image = each.value.image
  instance_zone = each.value.zone
  instance_network_id = module.internal_network[each.value.network_name].network_id
  instance_subnet_id = module.internal_network[each.value.network_name].subnet_id
  instance_tags = each.value.tags
  instance_key_pair_name = var.sel_ssh_key_name
  depends_on = [
    module.internal_network
  ]
}

// Create floating ip addresses
module "floating_ip" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/vpc/network/floating_ip"
  for_each = {for k, v in module.instance: k => v if var.instances[k].create_floating_ip == true}
  port_id = module.instance[each.key].instance_port_id
  depends_on = [
    module.instance
  ]
}

// Create DNS records
module "domain_record" {
  source = "git::https://github.com/sreway/terraform-selectel-modules.git//modules/dns/domain_record"
  for_each = var.dns_records
  domain_name = each.value.domain
  domain_record_name = each.value.name
  domain_record_type = each.value.type
  domain_record_ttl = each.value.ttl
  domain_record_content = module.floating_ip[each.value.link_instance_name].floating_ip
  depends_on = [
    module.floating_ip
  ]
}