resource "aws_iam_role" "lambda_ses_role" {
name   = "lambda-ses-role"
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_policy" "watch_policy_for_lambda" {
 
 name         = "aws_iam_policy_for_terraform_aws_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role"
 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role1" {
 role        = aws_iam_role.lambda_ses_role.name
 policy_arn  = aws_iam_policy.watch_policy_for_lambda.arn
}


resource "aws_iam_policy" "ses_policy_for_lambda" {
 
 name         = "ses_full_access"
 path         = "/"
 description  = "AWS IAM Policy for ses full access"
 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role2" {
 role        = aws_iam_role.lambda_ses_role.name
 policy_arn  = aws_iam_policy.ses_policy_for_lambda.arn
}

resource "aws_iam_policy" "s3_policy_for_lambda" {
 
 name         = "s3_full_access"
 path         = "/"
 description  = "AWS IAM Policy for s3 full access"
 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role3" {
 role        = aws_iam_role.lambda_ses_role.name
 policy_arn  = aws_iam_policy.s3_policy_for_lambda.arn
}