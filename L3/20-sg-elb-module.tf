module "elb_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "elbsecurity_group"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow Port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ] 
  egress_rules        = ["all-all"]
  tags                = local.common_tags
}