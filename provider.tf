provider "aws" {
  region = var.region
  # Credentials are read from environment variables injected by Jenkins (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY)
}
variable "region" {
  default = "us-east-1"
}
