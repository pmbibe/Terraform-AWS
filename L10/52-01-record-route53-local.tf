# locals {
#   zone_name   = keys(module.zones.route53_zone_zone_id)[0]
#   domain_name = "pmbibe.com"
#   #   zone_id = values(module.zones.route53_zone_zone_id)[0]
#   records = [
#     {
#       name    = "www"
#       type    = "CNAME"
#       ttl     = 300
#       records = [local.domain_name]
#     },
#     {
#       name = "app"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     },
#     {
#       name = "app1"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     },
#     {
#       name = "app2"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     },
#     {
#       name = "my-app-1"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     },
#     {
#       name = "my-app-2"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     },
#     {
#       name = "testnet"
#       type = "A"
#       alias = {
#         name                   = module.nlb.lb_dns_name
#         zone_id                = module.nlb.lb_zone_id
#         evaluate_target_health = true
#       }
#     }

#   ]
# }