# for index, instance in module.ec2-instance-private :
locals {
  number_of_tg_ids = 1
  # target_group_ids = distinct([
  #   for index, instance in module.ec2-instance-private : tonumber(index) % local.number_of_tg_ids
  target_group_ids = 1
  # ])
  nlb_target_groups = [{
    name             = join("", ["nlb-app", tostring(1)])
    backend_protocol = "TCP"
    backend_port     = 80
    target_type      = "instance" # Valid Values: instance | ip | lambda | alb
    deregistration_delay = 10
    health_check = {
      enabled             = true
      interval            = 30
      path                = "/app1/index.html"
      port                = "traffic-port"
      healthy_threshold   = 3
      unhealthy_threshold = 3
      timeout             = 6
    }
    # targets = flatten([
    #   for index_i, instance in module.ec2-instance-private :
    #   {
    #     target_id = module.ec2-instance-private[index_i].private_ip
    #     port      = 80
    #   } if tonumber(index_i) % local.number_of_tg_ids != tonumber(index)

    # ])
  }]
  nlb_http_tcp_listeners = [
    {
      port     = "80"
      protocol = "TCP"
      target_group_index = 0
      # action_type = "redirect"
      # redirect = {
      #   port        = "443"
      #   protocol    = "HTTPS"
      #   status_code = "HTTP_301"
      # }

    }
  ]
  # nlb_http_tcp_listener_rules = [{
  #     http_tcp_listener_index = 0
  #     priority                = 10
  #     actions = [
  #       {
  #         type               = "forward"
  #         target_group_index = 0
  #       }
  #     ]
  #     conditions = [{
  #       path_patterns = ["/app"]
  #     }]
  #   }]

  # nlb_http_tcp_listener_rules = [{
  #   http_tcp_listener_index = 0
  #   actions = [
  #     {
  #       type        = "redirect"
  #       host        = "stacksimplify.com"
  #       path        = "/aws-eks/"
  #       status_code = "HTTP_302"
  #       protocol    = "HTTPS"
  #       query       = ""
  #     }
  #   ]
  #   conditions = [{
  #     query_strings = [{
  #       key   = "website"
  #       value = "aws-eks"
  #     }]
  #   }]
  # }]
  # nlb_https_listeners = [
  #   {
  #     port            = 443
  #     protocol        = "HTTPS"
  #     certificate_arn = module.acm.acm_certificate_arn
  #     action_type     = "fixed-response"
  #     fixed_response = {
  #       content_type = "text/plain"
  #       message_body = "Fixed Static message - for Root Context"
  #       status_code  = "200"
  #     }
  #   }
  # ]

  # HTTPS Listener Rules
  # nlb_https_listener_rules = [
  #   for index in local.target_group_ids :
  #   {
  #     https_listener_index = 0
  #     actions = [
  #       {
  #         type               = "forward"
  #         target_group_index = index
  #       }
  #     ]
  #     conditions = [{
  #       host_headers = [join("", ["app", tostring(tonumber(index) + 1), ".${local.domain_name}"])]
  #     }]
  #   }
  # ]
}