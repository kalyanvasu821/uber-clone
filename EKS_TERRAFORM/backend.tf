terraform {
  backend "s3" {
    bucket = "vasu-0897" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "us-east-1"
  }
}
