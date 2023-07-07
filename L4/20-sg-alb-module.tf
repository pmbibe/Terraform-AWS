module "alb_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "albsecurity_group"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}