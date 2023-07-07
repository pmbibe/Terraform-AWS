output "bastionhost_ids" {
  value = module.ec2-instance-bastion.id
}
output "bastionhost_ips" {
  value = module.ec2-instance-bastion.public_ip
}