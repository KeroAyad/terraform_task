resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = "/home/kero/lambda/python/python.zip"
function_name                  = "Lambda_Function"
role                           = aws_iam_role.lambda_ses_role.arn
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role1, aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role2, aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role3]
}