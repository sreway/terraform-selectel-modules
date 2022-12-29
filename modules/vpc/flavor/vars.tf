variable "flavor_name" {
  type        = string
  description = "Name for the new flavor"
}

variable "flavor_ram" {
  type        = number
  default     = 2048
  description = "Amount of RAM to use (in megabytes)"
}

variable "flavor_vcpus" {
  type        = number
  default     = 2
  description = "Number of virtual CPUs to use"
}

variable "flavor_disk" {
  type        = number
  default     = 0
  description = "Amount of disk space (in gigabytes) to use for the root (/) partition"
}

variable "flavor_disk_remote" {
  type        = bool
  default     = false
  description = "Disk to use for the root (/) is remote disk"
}

variable "flavor_public" {
  type        = bool
  default     = false
  description = "Boolean value that defines whether the flavor is available to all users or private to the project it was created in"
}
