resource "aws_lambda_function_url" "test_latest" {
  function_name      = local.app_id
  authorization_type = "NONE"
  depends_on = [aws_lambda_function.lambda_func]
}

# resource "aws_lambda_function_url" "test_live" {
#   function_name      = local.app_id
#   authorization_type = "NONE"

#   cors {
#     allow_credentials = true
#     allow_origins     = ["*"]
#     allow_methods     = ["*"]
#     allow_headers     = ["date", "keep-alive"]
#     expose_headers    = ["keep-alive", "date"]
#     max_age           = 86400
#   }
# }