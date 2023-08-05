data "openstack_images_image_v2" "image" {
  most_recent = true
  name        = var.image_name
  visibility  = "public"
}
