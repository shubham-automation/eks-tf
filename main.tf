provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source = "./modules/eks-cluster"

  vpc_id                       = var.vpc_id
  subnet_ids                   = var.subnet_ids
  kubernetes_version           = var.eks_cluster_version
  endpoint_public_access       = var.endpoint_public_access
  endpoint_private_access      = var.endpoint_private_access
  create_security_group        = var.create_security_group
  apply_config_map_aws_auth    = var.apply_config_map_aws_auth
  tags                         = var.tags
  cluster_attributes           = var.eks_cluster_name

}

module "eks_node_group" {
  source            = "./modules/eks-node-group"
  #version           = "2.4.0"
  subnet_ids        = var.subnet_ids
  cluster_name      = module.eks_cluster.eks_cluster_id
  instance_types    = var.instance_types
  desired_size      = var.instance_desired_size
  min_size          = var.instance_min_size
  max_size          = var.instance_max_size
  module_depends_on = module.eks_cluster.kubernetes_config_map_id
}
