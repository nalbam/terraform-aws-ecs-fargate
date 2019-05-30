# dashboard

resource "aws_cloudwatch_dashboard" "app" {
  dashboard_name = "${aws_ecs_service.app.name}-${var.cluster_name}"

  dashboard_body = <<EOF
{
    "widgets": [{
            "type": "metric",
            "x": 12,
            "y": 6,
            "width": 12,
            "height": 6,
            "properties": {
                "title": "CPU and Memory utilization",
                "region": "${var.region}",
                "view": "timeSeries",
                "stacked": false,
                "period": 300,
                "metrics": [
                    [
                        "AWS/ECS", "MemoryUtilization",
                        "ClusterName", "${var.cluster_name}",
                        "ServiceName", "${aws_ecs_service.app.name}",
                        {
                            "color": "#1f77b4"
                        }
                    ],
                    [
                        ".", "CPUUtilization", ".", ".", ".", ".",
                        {
                            "color": "#9467bd"
                        }
                    ]
                ],
                "yAxis": {
                    "left": {
                        "min": 0,
                        "max": 100
                    }
                }
            }
        },
        {
            "type": "metric",
            "x": 0,
            "y": 6,
            "width": 12,
            "height": 6,
            "properties": {
                "title": "Container responses",
                "region": "${var.region}",
                "view": "timeSeries",
                "stacked": true,
                "period": 300,
                "metrics": [
                    [
                        "AWS/ApplicationELB", "HTTPCode_Target_5XX_Count",
                        "TargetGroup", "${aws_alb_target_group.app.arn_suffix}",
                        "LoadBalancer", "${aws_alb.app.arn_suffix}",
                        {
                            "period": 60,
                            "color": "#d62728",
                            "stat": "Sum"
                        }
                    ],
                    [
                        ".", "HTTPCode_Target_4XX_Count", ".", ".", ".", ".", {
                            "period": 60,
                            "stat": "Sum",
                            "color": "#bcbd22"
                        }
                    ],
                    [
                        ".", "HTTPCode_Target_3XX_Count", ".", ".", ".", ".", {
                            "period": 60,
                            "stat": "Sum",
                            "color": "#98df8a"
                        }
                    ],
                    [
                        ".", "HTTPCode_Target_2XX_Count", ".", ".", ".", ".", {
                            "period": 60,
                            "stat": "Sum",
                            "color": "#2ca02c"
                        }
                    ]
                ],
                "yAxis": {
                    "left": {
                        "min": 0
                    }
                }
            }
        },
        {
            "type": "metric",
            "x": 12,
            "y": 0,
            "width": 12,
            "height": 6,
            "properties": {
                "title": "Container response times",
                "region": "${var.region}",
                "view": "timeSeries",
                "stacked": false,
                "period": 300,
                "metrics": [
                    ["AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", "${aws_alb.app.arn_suffix}", {
                        "period": 60,
                        "stat": "p50"
                    }],
                    ["...", {
                        "period": 60,
                        "stat": "p90",
                        "color": "#c5b0d5"
                    }],
                    ["...", {
                        "period": 60,
                        "stat": "p99",
                        "color": "#dbdb8d"
                    }]
                ],
                "yAxis": {
                    "left": {
                        "min": 0,
                        "max": 3
                    }
                }
            }
        }, {
            "type": "metric",
            "x": 12,
            "y": 12,
            "width": 12,
            "height": 2,
            "properties": {
                "region": "${var.region}",
                "view": "singleValue",
                "stacked": false,
                "period": 300,
                "metrics": [
                    ["AWS/ApplicationELB", "HealthyHostCount", "TargetGroup", "${aws_alb_target_group.app.arn_suffix}", "LoadBalancer", "${aws_alb.app.arn_suffix}", {
                        "color": "#2ca02c",
                        "period": 60
                    }],
                    [".", "UnHealthyHostCount", ".", ".", ".", ".", {
                        "color": "#d62728",
                        "period": 60
                    }]
                ]
            }
        }, {
            "type": "metric",
            "x": 0,
            "y": 0,
            "width": 12,
            "height": 6,
            "properties": {
                "title": "Load balancer responses",
                "region": "${var.region}",
                "view": "timeSeries",
                "stacked": true,
                "period": 300,
                "metrics": [
                    ["AWS/ApplicationELB", "HTTPCode_Target_5XX_Count", "LoadBalancer", "${aws_alb.app.arn_suffix}", {
                        "period": 60,
                        "stat": "Sum",
                        "color": "#d62728"
                    }],
                    [".", "HTTPCode_Target_4XX_Count", ".", ".", {
                        "period": 60,
                        "stat": "Sum",
                        "color": "#bcbd22"
                    }],
                    [".", "HTTPCode_Target_3XX_Count", ".", ".", {
                        "period": 60,
                        "stat": "Sum",
                        "color": "#98df8a"
                    }],
                    [".", "HTTPCode_Target_2XX_Count", ".", ".", {
                        "period": 60,
                        "stat": "Sum",
                        "color": "#2ca02c"
                    }]
                ],
                "yAxis": {
                    "left": {
                        "min": 0
                    }
                }
            }
        }
    ]
}
EOF

}
