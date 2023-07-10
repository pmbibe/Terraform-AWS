locals {
  number_of_tg_ids = 3
  target_group_ids = distinct([
    for index, instance in module.ec2-instance-private : tonumber(index) % local.number_of_tg_ids
  ])
  alb_target_groups = flatten([
    [
      for index in local.target_group_ids :
      {
        name             = join("", ["alb-app", tostring(index + 1)])
        backend_protocol = "HTTP"
        protocol_version = "HTTP1"
        backend_port     = 80
        target_type      = "instance"
        health_check = {
          enabled             = true
          interval            = 30
          path                = join("", ["/app", tostring(index + 1), "/index.html"])
          port                = "traffic-port"
          healthy_threshold   = 3
          unhealthy_threshold = 3
          timeout             = 6
          protocol            = "HTTP"
          matcher             = "200-399"
        }
        targets = flatten([
          for index_i, instance in module.ec2-instance-private :
          {
            target_id = module.ec2-instance-private[index_i].id
            port      = 80
          } if tonumber(index_i) % local.number_of_tg_ids != tonumber(index)

        ])
      }
    ]

  ])
  alb_http_tcp_listeners = [
    {
      port     = "80"
      protocol = "HTTP"
      # action_type = "redirect"
      # redirect = {
      #   port        = "443"
      #   protocol    = "HTTPS"
      #   status_code = "HTTP_301"
      # }

    }
  ]
  alb_http_tcp_listener_rules = flatten([

    [{
      http_tcp_listener_index = 0
      priority                = 100
      actions = [
        {
          type = "fixed-response"

          content_type = "text/plain"
          message_body = "Fixed Static message - for Root Context"
          status_code  = "200"

        }
      ]
      conditions = [{
        host_headers = [join(".", ["app", "${local.domain_name}"])]
      }]
    }],
    [
      for index in local.target_group_ids :
      {
        http_tcp_listener_index = 0
        priority                = index + 1
        actions = [
          {
            type               = "forward"
            target_group_index = index
          }
        ]
        conditions = [{
          host_headers = [join("", ["app", tostring(tonumber(index) + 1), ".${local.domain_name}"])]
        }]
      }
    ],
    [
      for index in local.target_group_ids :
      {
        http_tcp_listener_index = 0
        priority                = index + 3
        actions = [
          {
            type               = "forward"
            target_group_index = index
          }
        ]
        conditions = [{
          http_headers = [{
            http_header_name = "custom-header"
            values           = [join("", ["my-app-", tostring(tonumber(index) + 1)])]
          }]
        }]
      }
    ],

    [{
      http_tcp_listener_index = 0
      priority                = 200
      actions = [
        {
          type        = "redirect"
          host        = "stacksimplify.com"
          path        = "/aws-eks/"
          status_code = "HTTP_302"
          protocol    = "HTTPS"
          query       = ""
          port        = 443
        }
      ]
      conditions = [{
        query_strings = [{
          key   = "website"
          value = "aws-eks"
        }]
      }]
    }],
    [{
      http_tcp_listener_index = 0
      priority                = 300
      actions = [
        {
          type        = "redirect"
          host        = "stacksimplify.com"
          status_code = "HTTP_302"
          path        = "/azure-aks/azure-kubernetes-service-introduction/"
          query       = ""
          port        = 443
          protocol    = "HTTPS"
        }

      ]
      conditions = [{
        host_headers = ["testnet.pmbibe.com"]

      }]
    }]
  ])

  # alb_https_listeners = [
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
  # alb_https_listener_rules = [
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