data "aws_regions" "current" {
    all_regions = true
}

variable "region" {
  description = "The AWS region to use"
  default     = "us-east-1"
  type        = string
  validation {
    condition     = contains([aws_regions.current.name], var.region)
    error_message = "Not a valid region."
  }
}