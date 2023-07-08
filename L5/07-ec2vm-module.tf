module "ec2-instance-private" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.2.0"
  count                  = var.ec2_private_instance_count
  name                   = (tonumber(count.index) % 2 == 1 ? "${var.environment}-vm-app1" : "${var.environment}-vm-app2")
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.ec2_instance_type
  key_name               = var.ec2_instance_keypair
  subnet_id              = (tonumber(count.index) % 2 == 1 ? element(module.vpc.private_subnets, "1") : element(module.vpc.private_subnets, "0"))
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  user_data              = (tonumber(count.index) % 2 == 1 ? file("${path.module}/app1-install.sh") : file("${path.module}/app2-install.sh"))


  tags       = local.common_tags
  depends_on = [module.vpc]
}   