output "domain_content" {
  value = selectel_domains_record_v1.record.content
}

output "domain_name" {
    value = selectel_domains_record_v1.record.name
}

output "domain_id" {
    value = selectel_domains_record_v1.record.domain_id
}

output "domain_email" {
  value = selectel_domains_record_v1.record.email
}

output "domain_priority" {
  value = selectel_domains_record_v1.record.priority
}

output "domain_weight" {
  value = selectel_domains_record_v1.record.weight
}

output "domain_port" {
  value = selectel_domains_record_v1.record.port
}

output "domain_target" {
  value = selectel_domains_record_v1.record.target
}