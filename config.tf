data "aws_caller_identity" "current" {}

resource "aws_config_configuration_recorder" "config" {
  name     = "${data.aws_caller_identity.current.account_id}-configRecorder"
  role_arn = aws_iam_role.config.arn
}

resource "aws_config_configuration_recorder_status" "config" {
  name = aws_config_configuration_recorder.config.name
  is_enabled = true
}
resource "aws_config_delivery_channel" "delivery_bucket" {
  name = "${data.aws_caller_identity.current.account_id}-configDeliveryChannel"
  s3_bucket_name = aws_s3_bucket.config_bucket.id
  depends_on = [aws_config_configuration_recorder.config]
}