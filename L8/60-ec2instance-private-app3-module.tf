# module "ec2_private_app3" {
#   depends_on = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
#   source     = "terraform-aws-modules/ec2-instance/aws"
#   version    = "5.2.0"
#   # insert the 10 required variables here
#   name          = "${var.environment}-app3"
#   ami           = data.aws_ami.amzlinux2.id
#   instance_type = var.ec2_instance_type
#   key_name      = var.ec2_instance_keypair
#   #monitoring             = true
#   vpc_security_group_ids = [module.private_security_group.security_group_id]
#   subnet_id              = module.vpc.private_subnets[0]
#   #user_data = file("${path.module}/app3-ums-install.tmpl") - THIS WILL NOT WORK, use Terraform templatefile function as below.
#   #https://www.terraform.io/docs/language/functions/templatefile.html
#   user_data = templatefile("app3-ums-install.tmpl", { rds_db_endpoint = module.db.db_instance_address })
#   tags      = local.common_tags
# }