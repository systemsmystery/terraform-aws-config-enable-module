variable "region" {
  description = "The AWS region to use"
  default     = "us-east-1"
  type        = string
  validation {
    condition     = contains(["us-east-1", "us-east-2", "us-west-1", "us-west-2", "ap-east-1", "ap-south-1", "ap-northeast-3", "ap-northeast-2", "ap-southeast-1", "ap-southeast-2", "ap-northeast-1", "ca-central-1", "cn-north-1", "cn-northwest-1", "eu-central-1", "eu-west-1", "eu-west-2", "eu-west-3", "eu-north-1", "me-south-1", "sa-east-1"], var.region)
    error_message = "Not a valid region."
  }
}

variable "iam_role_arn" {
    description = "The ARN of the IAM role to use with Config"
    type        = string
}

variable "config_bucket_id" {
    description = "The ID of the S3 bucket to use with Config"
    type        = string
}
