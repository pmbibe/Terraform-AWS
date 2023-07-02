# data "aws_ec2_instance_type_offerings" "ins_types" {
#     for_each = toset([ "us-east-1a", "us-east-1e" ])
#     filter {
#         name = "instance-type"
#         values = ["t3.micro"]
#     }
#     filter {
#         name = "location"
#         values = [each.key]
#     }
#     location_type = "availability-zone"


# }

# # Output as set of strings
# output "out_1" {
#     value = toset([
#             for t in data.aws_ec2_instance_type_offerings.ins_types : t.instance_types
#         ])
# }

# # Output as map
# output "out_2" { 
#     value = { 
#             for az, details in data.aws_ec2_instance_type_offerings.ins_types : az => details.instance_types 
#         }

# }