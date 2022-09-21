data "aws_caller_identity" "current" {}

resource "aws_config_configuration_recorder" "config" {
  name     = "${data.aws_caller_identity.current.account_id}-configRecorder"
  role_arn = var.iam_role_arn
}

resource "aws_config_configuration_recorder_status" "config" {
  name = aws_config_configuration_recorder.config.name
  is_enabled = true
}
resource "aws_config_delivery_channel" "delivery_bucket" {
  name = "${data.aws_caller_identity.current.account_id}-configDeliveryChannel"
  s3_bucket_name = var.config_bucket_id
  s3_key_prefix = var.region
  depends_on = [aws_config_configuration_recorder.config]
}