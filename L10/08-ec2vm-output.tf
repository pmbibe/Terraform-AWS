# output "ec2_instance_ids" {
#   value = [for ec2private in module.ec2-instance-private : ec2private.id]

# }
# output "ec2_private_ips" {
#   value = [for ec2private in module.ec2-instance-private : ec2private.private_ip]
# }