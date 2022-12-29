variable "volume_name" {
  type        = string
  description = "A unique name for the volume"
}

variable "volume_size" {
  type        = number
  description = "The size of the volume to create (in gigabytes)"
}

variable "volume_image_id" {
  type        = string
  default     = null
  description = "The image ID from which to create the volume"
}

variable "volume_type" {
  type        = string
  description = "The type of volume to create. Available types: fast, basic, universal"
}

variable "volume_zone" {
  type        = string
  description = "The type of volume to create. Changing this creates a new volume"
}