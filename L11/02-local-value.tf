locals {
  #   owner = var.owner
  #   environment = var.environment
  name = "${var.owner}-${var.environment}"
  common_tags = {
    owner       = var.owner
    environment = var.environment

  }
}