resource "aws_secretsmanager_secret_rotation" "rotation" {
  secret_id           = aws_secretsmanager_secret.pg-secret.id
  rotation_lambda_arn = aws_lambda_function.lambda-function.arn

  rotation_rules {
    automatically_after_days = 30
  }
}

resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowSecretsManagerToInvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = "lambda-function"
  principal     = "secretsmanager.amazonaws.com"
}