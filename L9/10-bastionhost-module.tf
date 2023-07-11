# module "ec2-instance-bastion" {
#   source                 = "terraform-aws-modules/ec2-instance/aws"
#   version                = "5.2.0"
#   name                   = "${var.environment}-BastionHost"
#   ami                    = data.aws_ami.amzlinux2.id
#   instance_type          = var.ec2_instance_type
#   key_name               = var.ec2_instance_keypair
#   subnet_id              = module.vpc.public_subnets[0]
#   vpc_security_group_ids = [module.bastion_security_group.security_group_id]
#   tags                   = local.common_tags
# }