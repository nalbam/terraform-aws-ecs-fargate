# autoscale cpu

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${aws_ecs_service.app.name}-CPU-Utilization-High-${var.cpu_high}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.cpu_high

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = aws_ecs_service.app.name
  }

  alarm_actions = [aws_appautoscaling_policy.app_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${aws_ecs_service.app.name}-CPU-Utilization-Low-${var.cpu_low}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = var.cpu_low

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = aws_ecs_service.app.name
  }

  alarm_actions = [aws_appautoscaling_policy.app_down.arn]
}
