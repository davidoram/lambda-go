provider "aws" {
  region = "ap-southeast-2"
}

variable "app_name" {
  description = "Application name"
  default     = "sample-lambda-api"
}

variable "app_env" {
  description = "Application environment tag"
  default     = "dev"
}

locals {
  app_id = "${lower(var.app_name)}-${lower(var.app_env)}-${random_id.unique_suffix.hex}"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "../build/bin/app"
  output_path = "build/bin/app.zip"
}

resource "random_id" "unique_suffix" {
  byte_length = 2
}
output "api_url" {
  value = aws_lambda_function_url.test_latest.function_url
}