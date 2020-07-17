resource "aws_iam_role" "role" {
    name = var.role-name
    assume_role_policy = file(var.trust-relationship-policy)

    tags = var.tags
}

resource "aws_iam_role_policy" "role-policy" {
    name = var.role-policy-name
    role = aws_iam_role.role.id
    policy = file(var.policy-file)
}