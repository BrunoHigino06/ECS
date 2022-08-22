#ECS cluster
resource "aws_ecs_cluster" "MainCluster" {
  name = var.ClusterName

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    name = var.ClusterName
    environment = "production"
  }
}

#ECR repositories
resource "aws_ecr_repository" "MainRepository" {
    count = length(var.EcrNames)
    name                 = var.EcrNames[count.index]
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        name = var.EcrNames[count.index]
        environment = "production"
        service = var.EcrNames[count.index]
    }
}

#ECS Services
