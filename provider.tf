provider "aws" {
  region = var.region
  default_tags {
    tags = {
      TF_ACCOUNT_HARDENING = "true"
    }
  }
}