terraform {
  backend "s3" {
    bucket = "ashraf-aws-statefile"
    key    = "back-end/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-lock"
    encrypt = true
  }
}