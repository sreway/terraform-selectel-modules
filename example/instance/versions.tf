terraform {

  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }

    selectel = {
      source = "selectel/selectel"
    }

  }
  required_version = ">= 0.13"
}