# module "bastion_security_group" {
#   source              = "terraform-aws-modules/security-group/aws"
#   version             = "5.1.0"
#   name                = "bastion_security_group"
#   vpc_id              = module.vpc.vpc_id
#   ingress_rules       = ["ssh-tcp"]
#   ingress_cidr_blocks = ["0.0.0.0/0"]
#   egress_rules        = ["all-all"]
#   tags                = local.common_tags
# }