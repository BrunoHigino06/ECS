#ECS vars
#Cluster vars
variable "ClusterName" {
    description = "Name of the ECS cluster"
}

#ECR vars
variable "EcrNames" {
  type = list(string)
  description = "Name of the ECR Repositories"
}