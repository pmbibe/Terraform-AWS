# module "zones" {
#   source  = "terraform-aws-modules/route53/aws//modules/zones"
#   version = "~> 2.0"

#   # zones = {
#   #   zone1 = {
#   #     domain_name   = "pmbibe.com"
#   #     comment       = "pmbibe.com (staging)"
#   #     force_destroy = false
#   #     tags = {
#   #       env = "staging"
#   #     }
#   #   }

#   # }
#   zones = {
#     "pmbibe.com" = {
#       comment       = "pmbibe.com (staging)"
#       force_destroy = false
#       tags = {
#         env = "staging"
#       }
#     }
#   }

#   tags = {
#     ManagedBy = "Terraform"
#   }
# }
