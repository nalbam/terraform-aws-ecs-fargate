# ecs asg
# resource "aws_appautoscaling_target" "main" {
#   service_namespace  = "ecs"
#   resource_id        = "service/${var.cluster_name}/${aws_ecs_service.main.name}"
#   scalable_dimension = "ecs:service:DesiredCount"
#   max_capacity       = "${var.max}"
#   min_capacity       = "${var.min}"
# }

