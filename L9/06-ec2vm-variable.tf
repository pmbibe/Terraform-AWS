variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"

}
variable "ec2_instance_keypair" {
  type    = string
  default = "terraform-key"
}
# variable "ec2_private_instance_count" {
#   type    = number
#   default = 1
# }