data "selectel_domains_domain_v1" "domain" {
  name = var.domain_name
}

resource "selectel_domains_record_v1" "record" {
  domain_id = data.selectel_domains_domain_v1.domain.id
  name = var.domain_record_name
  type = var.domain_record_type
  content = var.domain_record_content
  ttl = var.domain_record_ttl
}