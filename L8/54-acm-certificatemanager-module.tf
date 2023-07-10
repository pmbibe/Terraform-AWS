# locals {

#   domainname = trimsuffix(values(module.zones.route53_zone_name)[0], ".")

# }

# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"

#   domain_name = local.domainname
#   zone_id     = values(module.zones.route53_zone_zone_id)[0]

#   wait_for_validation = true
#   subject_alternative_names = [
#     "*.${local.domainname}"
#   ]
#   tags = {
#     Name = values(module.zones.route53_zone_name)[0]
#   }
# }