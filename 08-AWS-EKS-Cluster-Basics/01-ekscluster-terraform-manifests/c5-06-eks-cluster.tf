# Create AWS EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${local.name}-${var.cluster_name}" #c5-01
  role_arn = aws_iam_role.eks_master_role.arn #c5-03
  version = var.cluster_version #c5-01

  vpc_config {
    subnet_ids = module.vpc.public_subnets #c3-03
    endpoint_private_access = var.cluster_endpoint_private_access #eks.auto.tfvars
    endpoint_public_access  = var.cluster_endpoint_public_access #eks.auto.tfvars
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs #eks.auto.tfvars    
  }

  kubernetes_network_config {
    service_ipv4_cidr = var.cluster_service_ipv4_cidr #eks.auto.tfvars    
  }
  
  # infortant!
  # Enable EKS Cluster Control Plane Logging
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy, #c5-03
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController, #c5-03
  ]
}
