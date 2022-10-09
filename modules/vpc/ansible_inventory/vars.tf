variable "instance_id" {
  type = map(object({
    id = string
  }))

  description = "Compute instance ids"
}


variable "floating_ip" {
  type = map(object({
    ip_address = string
  }))

  description = "Available floating ip address"
}