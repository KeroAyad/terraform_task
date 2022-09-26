data "aws_s3_bucket" "selected" {
  bucket = "iti-terraform-state"
}

resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = data.aws_s3_bucket.selected.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]

  }
  depends_on = [aws_lambda_permission.test]
}

resource "aws_lambda_permission" "test" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.selected.arn
}