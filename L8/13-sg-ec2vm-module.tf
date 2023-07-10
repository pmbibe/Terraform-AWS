module "private_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "private_security_group"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "http-8080-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}