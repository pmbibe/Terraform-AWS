alb_name = "alb-test"
alb_type = "application"
alb_http_tcp_listeners = [
  {
    port     = "80"
    protocol = "HTTP"
  }
]
