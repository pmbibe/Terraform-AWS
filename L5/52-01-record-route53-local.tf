locals {
  zone_name = keys(module.zones.route53_zone_zone_id)[0]
  #   zone_id = values(module.zones.route53_zone_zone_id)[0]
  records = [
    {
      name    = "www"
      type    = "CNAME"
      ttl     = 300
      records = ["pmbibe.com"]
    },
    {
      name = "app"
      type = "A"
      alias = {
        name                   = module.alb.lb_dns_name
        zone_id                = module.alb.lb_zone_id
        evaluate_target_health = true
      }
    }

  ]
}