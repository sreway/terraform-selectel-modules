output "instances" {
  value = module.instance.*
}

output "floating_ip" {
  value = module.floating_ip.*
}

output "dns_records" {
  value = module.floating_ip.*
}