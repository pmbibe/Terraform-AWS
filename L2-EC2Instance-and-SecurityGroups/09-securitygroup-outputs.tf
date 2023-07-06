output "bastion_sg_id" {
  value = module.bastion_security_group.security_group_id
}
output "bastion_sg_vpc_id" {
  value = module.bastion_security_group.security_group_vpc_id

}
output "bastion_sg_name" {
  value = module.bastion_security_group.security_group_name

}

output "private_sg_id" {
  value = module.private_security_group.security_group_id

}
output "private_sg_vpc_id" {
  value = module.private_security_group.security_group_vpc_id

}
output "private_sg_name" {
  value = module.private_security_group.security_group_name

}