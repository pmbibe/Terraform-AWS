module "asg_alarm" {
  source              = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version             = "~> 3.0"
  alarm_name          = "App1-ASG-CWA-CPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = module.autoscaling.autoscaling_group_name
  }

  alarm_description = "This metric monitors ec2 cpu utilization and triggers the ASG Scaling policy to scale-out if CPU is above 80%"

  ok_actions = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions = [
    module.autoscaling.autoscaling_policy_arns["policy-1"],
    aws_sns_topic.myasg_sns_topic.arn
  ]
}
