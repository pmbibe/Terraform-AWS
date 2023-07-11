
module "alb" {
  source                  = "terraform-aws-modules/alb/aws"
  version                 = "8.7.0"
  name                    = var.alb_name
  load_balancer_type      = var.alb_type
  subnets                 = [for subnet in module.vpc.public_subnets : subnet]
  security_groups         = [module.alb_security_group.security_group_id]
  target_groups           = local.alb_target_groups
  http_tcp_listeners      = local.alb_http_tcp_listeners
  http_tcp_listener_rules = local.alb_http_tcp_listener_rules
  # https_listeners      = local.alb_https_listeners
  # https_listener_rules = local.alb_https_listener_rules
  vpc_id = module.vpc.vpc_id

}