resource "openstack_blockstorage_volume_v3" "volume" {
  name              = var.volume_name
  size              = var.volume_size
  image_id          = var.volume_image_id
  volume_type       = "${var.volume_type}.${var.volume_zone}"
  availability_zone = var.volume_zone

  lifecycle {
    ignore_changes = [image_id]
  }
}