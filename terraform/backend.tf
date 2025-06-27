terraform {
  backend "s3" {
    bucket         = "devsecops-tf-state-bucket"
    key            = "env/devsecops/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
