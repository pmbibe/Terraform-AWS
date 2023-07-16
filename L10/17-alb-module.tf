
module "nlb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "8.7.0"
  name               = var.nlb_name
  load_balancer_type = var.nlb_type
  subnets            = [for subnet in module.vpc.public_subnets : subnet]
  # security_groups    = [module.nlb_security_group.security_group_id]
  target_groups      = local.nlb_target_groups
  http_tcp_listeners = local.nlb_http_tcp_listeners
  # http_tcp_listener_rules = local.nlb_http_tcp_listener_rules
  # https_listeners      = local.nlb_https_listeners
  # https_listener_rules = local.nlb_https_listener_rules
  vpc_id = module.vpc.vpc_id

}