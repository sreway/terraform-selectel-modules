variable "domain_name" {
  type        = string
  description = "The name of the domain"
}

variable "domain_record_name" {
  type        = string
  description = "Represents a name of the domain record"
}

variable "domain_record_type" {
  type        = string
  description = "Represents a type of the record. Possible values: A, AAAA, TXT, CNAME, NS, SOA, MX, SRV"
}

variable "domain_record_ttl" {
  type        = string
  description = "Represents a time-to-live for the record. Must be the value between 60 and 604800"
}

variable "domain_record_content" {
  type        = string
  default     = null
  description = "Represents a content of the record. Absent for SRV records"
}

variable "domain_record_email" {
  type        = string
  default     = null
  description = "Represents an email of the domain's admin. For SOA records only"
}

variable "domain_record_priority" {
  type        = string
  default     = null
  description = "Represents priority of the records preferences. Lower value means more preferred. MX/SRV records only"
}

variable "domain_record_weight" {
  type        = string
  default     = null
  description = "Represents priority of the records preferences. Lower value means more preferred. MX/SRV records only"
}

variable "domain_record_port" {
  type        = string
  default     = null
  description = "Represents TCP or UDP port on which the service is to be found. For SRV records only"
}

variable "domain_record_target" {
  type        = string
  default     = null
  description = "Represents a canonical hostname of the machine providing the service. For SRV records only"
}