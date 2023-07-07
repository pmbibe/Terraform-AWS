module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "4.0.1"
  name    = var.elb_name
  # 
  subnets         = [for subnet in module.vpc.public_subnets : subnet]
  health_check    = var.elb_health_check
  listener        = var.elb_listener
  security_groups = [module.elb_security_group.security_group_id]
  # 
  number_of_instances = var.elb_number_of_instances
  instances           = [for instance in module.ec2-instance-private : instance.id]
  # 
  tags       = local.common_tags
  depends_on = [module.vpc, module.ec2-instance-private]
}