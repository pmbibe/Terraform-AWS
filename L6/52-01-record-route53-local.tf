locals {
  zone_name   = keys(module.zones.route53_zone_zone_id)[0]
  domain_name = "pmbibe.com"
  #   zone_id = values(module.zones.route53_zone_zone_id)[0]
  records = [
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = [local.domain_name]
    },
    {
      name = "app"
      type = "A"
      alias = {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
      }
    },
    {
      name = "app1"
      type = "A"
      alias = {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
      }
    },
    {
      name = "app2"
      type = "A"
      alias = {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
      }
    }

  ]
}