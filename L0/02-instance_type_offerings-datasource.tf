data "aws_availability_zones" "azones" {

  filter {

    name = "opt-in-status"

    values = ["opt-in-not-required"]
  }

}

data "aws_ec2_instance_type_offerings" "ins_type" {
  for_each = toset(data.aws_availability_zones.azones.names)
  filter {
    name = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name="location"
    values = [each.key]
  }
  location_type = "availability-zone"
}
# # as map
# output "output_1" {
#   value = {
#     for az, details in data.aws_ec2_instance_type_offerings.ins_type :
#       az => details.instance_types
#   }
# }

# # as map with "if"
# output "output_2" {
#   value = {
#     for az, details in data.aws_ec2_instance_type_offerings.ins_type :
#       az => details.instance_types
#         if length(details.instance_types) != 0
#   }
# }

# # as keys of map (list)
# output "output_3" {
#   value = keys({
#     for az, details in data.aws_ec2_instance_type_offerings.ins_type:
#       az => details.instance_types
#         if length(details.instance_types) != 0
#   })
# }

# # the first element of list
# output "output_4" {
#   value = keys({ 
#     for az, details in data.aws_ec2_instance_type_offerings.ins_type :
#       az => details.instance_types 
#         if length(details.instance_types) != 0 
#   })[0]

  
# }