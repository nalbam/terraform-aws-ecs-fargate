# locals

locals {
  name = format("%s-%s", var.name, var.stage)

  domain = var.domain != "" ? var.domain : format("%s.%s.%s", local.name, var.cluster_name, var.base_domain)

  dns_name = var.base_domain != "" ? local.domain : aws_alb.app.dns_name
}

locals {
  port_mappings = [
    {
      containerPort = var.port
      hostPort      = var.port
      protocol      = "tcp"
    },
  ]

  environment = concat(
    var.environment,
    [
      {
        name  = "PROFILE"
        value = var.stage
      },
    ]
  )

  container_definition = {
    name         = local.name
    image        = var.image
    cpu          = var.cpu
    memory       = var.memory
    portMappings = local.port_mappings
    environment  = local.environment
  }

  json_map = jsonencode(local.container_definition)
}
