variable "elb_name" {
  type    = string
  default = "elb"
}
# variable "elb_subnets" {
#   type = list(string)

# }
variable "elb_health_check" {
  type = map(string)
  default = {
    target             = "HTTP:80/"
    interval           = 30
    unhealthyThreshold = 2
    healthyThreshold   = 2
    timeout            = 3
  }
}
variable "elb_listener" {
  type = list(map(string))
  default = [{
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
    },
    {
      instance_port     = 443
      instance_protocol = "HTTPS"
      lb_port           = 443
      lb_protocol       = "HTTPS"
  }]

}
variable "elb_number_of_instances" {
  type    = number
  default = 1

}