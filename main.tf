resource "aws_iam_user" "user" {
  name = var.username
  tags = {
    Description = "Created by Jenkins/Terraform"
  }
}

resource "aws_iam_policy" "admin_policy" {
  name   = "${var.username}-policy"
  policy = file("${path.module}/admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "user_attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

output "iam_username" {
  value = aws_iam_user.user.name
}
