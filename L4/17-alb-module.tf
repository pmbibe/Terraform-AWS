module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "8.7.0"
  name               = var.alb_name
  load_balancer_type = var.alb_type
  subnets            = [for subnet in module.vpc.public_subnets : subnet]
  security_groups    = [module.alb_security_group.security_group_id]
  target_groups = [
    {
      name             = "alb-basic-test"
      backend_protocol = "HTTP"
      protocol_version = "HTTP1"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      targets = flatten([
        for index, instance in module.ec2-instance-private : {
          target_id = instance.id
          port      = 80

        }
      ])
    }
  ]
  http_tcp_listeners = var.alb_http_tcp_listeners

  vpc_id = module.vpc.vpc_id

}