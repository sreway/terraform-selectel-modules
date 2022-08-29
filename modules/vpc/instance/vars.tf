variable "instance_key_pair_name" {
  type = string
  description = "The name of a key pair to put on the compute instance. The key pair must already be created for the user under which terraform is launched"
}

variable "instance_name" {
  type = string
  description = "Name for the new instance"
}

variable "instance_ram" {
  type = number
  default = 2048
  description = "Amount of RAM to use (in megabytes)"
}

variable "instance_vcpus" {
  type = number
  default = 2
  description = "Number of virtual CPUs to use"
}

variable "instance_disk" {
  type = number
  default = 0
  description = "Amount of disk space (in gigabytes) to use for the root (/) partition"
}

variable "instance_public" {
  type = bool
  default = false
  description = "Boolean value that defines whether the flavor is available to all users or private to the project it was created in"
}

variable "instance_zone" {
  type = string
  description = "Zone of compute instance"
}

variable "instance_image" {
  type = string
  description = "Name of the OpenStack image"
}

variable "instance_network_id" {
  type = string
  description = "Network ID for attach instance"
}

variable "instance_subnet_id" {
  type = string
  description = "Subnet ID for attach instance"
}

variable "instance_tags" {
  type = list(string)
  default = null
  description = "Instance tags"  
}

variable "instance_remote_volumes" {
  type = map(object(
        {
          name = string
          size = number
          type = string
          zone = string
        }
  ))
  default = {}
  description = "Remote volumes of the compute instance"
}