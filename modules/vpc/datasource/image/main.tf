data "openstack_images_image_v2" "image" {
  name       = var.image_name
  visibility = "public"
}