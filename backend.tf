terraform {
  backend "s3" {
    bucket         = "tfstate-bucket-1-surendra"    # Replace with your actual bucket name
    key            = "envs/dev/terraform.tfstate"   # Path to your state file in the bucket
    region         = "eu-west-1"                    # AWS region where the bucket and table exist
    dynamodb_table = "tfstate-lock"                 # DynamoDB table for state locking
    encrypt        = true                           # Encrypt the state file at rest
  }
}
