elb_name = "elb"
elb_health_check = {
  target              = "HTTP:80/"
  interval            = 30
  healthy_threshold   = 3
  unhealthy_threshold = 3
  timeout             = 5
}
elb_listener = [{
  instance_port     = 80
  instance_protocol = "HTTP"
  lb_port           = 80
  lb_protocol       = "HTTP"
  },
  {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 81
    lb_protocol       = "HTTP"
}]
elb_number_of_instances = 1