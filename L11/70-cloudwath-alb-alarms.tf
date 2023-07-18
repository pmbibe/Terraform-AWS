module "alb_alarm" {
  source              = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version             = "~> 3.0"
  alarm_name          = "App1-ALB-HTTP-4xx-errors"
  alarm_description   = "This metric monitors ALB HTTP 4xx errors and if they are above 100 in specified interval, it is going to send a notification email"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  datapoints_to_alarm = 2
  threshold           = 5
  period              = 120
  unit                = "Count"
  treat_missing_data  = "missing"
  metric_name         = "HTTPCode_Target_4XX_Count"
  namespace           = "AWS/ApplicationELB"
  statistic           = "Sum"
  ok_actions          = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions       = [aws_sns_topic.myasg_sns_topic.arn]
  dimensions = {
    LoadBalancer = module.alb.lb_arn_suffix
  }
}
