output "bastionhost_ids" {
  value = module.ec2-instance-bastion.id
}
output "bastionhost_ips" {
  value = module.ec2-instance-bastion.public_ip
}
output "ec2_instance_ids" {
  value = [for ec2private in module.ec2-instance-private : ec2private.id]

}
output "ec2_private_ips" {
  value = [for ec2private in module.ec2-instance-private : ec2private.private_ip]
}