locals {
  asg_tags = {
    key                 = "Project"
    value               = "megasecret"
    propagate_at_launch = true
  }
}