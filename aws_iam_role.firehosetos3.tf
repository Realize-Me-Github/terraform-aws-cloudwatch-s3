resource "aws_iam_role" "firehosetos3" {
  name = "${var.cloudwatch_name}-FIREHOSETOS3-${upper(var.region_desc)}"

  assume_role_policy = <<EOF
{
    "Statement": {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "${data.aws_caller_identity.current.account_id}"
        }
      }
    }
  }
EOF
}
