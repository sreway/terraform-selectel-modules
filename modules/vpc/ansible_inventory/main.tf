
locals {
  ansible_inventory = templatefile("${path.module}/templates/inventory.tpl", {
    instances    = var.instances
    floating_ips = var.floating_ips
    tags         = distinct(flatten([for item in var.instances : item.tags]))
  })
}