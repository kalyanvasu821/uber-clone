resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::881490093601:role/ec2-uber"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-05e501444e58b91b5", "subnet-0286e9afc3e9830ba"]  # Replace with your subnet IDs
    security_group_ids = ["sg-05e385a6b044cbaf7"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::881490093601:role/ec2-uber"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-05e501444e58b91b5", "subnet-0286e9afc3e9830ba"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
