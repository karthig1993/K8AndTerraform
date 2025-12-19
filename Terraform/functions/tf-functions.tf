provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "test_user" {
  name = "testing_tf_user"
}

resource "aws_iam_user_policy" "test_policy" {
  name = "test_user_policy"
  user = aws_iam_user.test_user.name

  policy = file("./iam-user-policy.json")

}
