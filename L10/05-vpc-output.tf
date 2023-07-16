output "vpc_id" {
  value = module.vpc.vpc_id
}
output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block

}
output "vpc_private_subnets" {
  value = module.vpc.private_subnets

}

output "vpc_public_subnets" {
  value = module.vpc.public_subnets

}
# VPC NAT gateway Public IP

output "vpc_public_ips" {
  value = module.vpc.nat_public_ips

}

output "vpc_azs" {
  value = module.vpc.azs
}