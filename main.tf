provider "aws" {
  region = "us-east-1"  
}
resource "aws_sns_topic" "cpu_alert_topic" {
    name = "high_cpu_alerts"
}
resource "aws_sns_topic_subscription" "email_subscription" {
    topic_arn = aws_sns_topic.cpu_alert_topic.arn
    protocol = "email"
    endpoint = var.alert_email
}
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_alarm" {
    alarm_name          = "high_cpu_utilization"
    comparison_operator = "GreaterThanThreshold"
    evaluation_periods  = "2"
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Average"
    threshold           = "70"
    alarm_description   = "This metric monitors ec2 cpu utilization"
    alarm_actions       = [aws_sns_topic.cpu_alert_topic.arn]
    dimensions = {
        InstanceId = var.instance_id
    }
}
