module "rds_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name    = "rds_security_group"
  vpc_id  = module.vpc.vpc_id
  #   Security group with predefined rules
  ingress_rules       = ["mysql-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  #   Security group with custom rules
  # ingress_with_cidr_blocks = [
  #   {
  #     from_port   = 3306
  #     to_port     = 3306
  #     protocol    = "tcp"
  #     description = "MySQL access from within VPC"
  #     cidr_blocks = module.vpc.vpc_cidr_block
  #   }
  # ]
  egress_rules = ["all-all"]
  tags         = local.common_tags
}