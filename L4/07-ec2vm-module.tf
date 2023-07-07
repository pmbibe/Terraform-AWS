module "ec2-instance-private" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.2.0"
  count                  = var.ec2_private_instance_count
  name                   = "${var.environment}-vm-${count.index}"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  subnet_id              = element(module.vpc.private_subnets, count.index)
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  user_data              = file("${path.module}/app1-install.sh")
  tags                   = local.common_tags
}   