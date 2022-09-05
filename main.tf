module "ecs" {
    source = ".\\infrastructure\\ecs\\"
    providers = {
        aws = aws.us
    }

    #Cluster inputs
    ClusterName = var.ClusterName
}