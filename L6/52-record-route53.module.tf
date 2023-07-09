module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = local.zone_name
  # zone_id = local.zone_id
  records = local.records

  depends_on = [module.zones]
}