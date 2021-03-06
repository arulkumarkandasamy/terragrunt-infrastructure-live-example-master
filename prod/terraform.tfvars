# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
terragrunt = {
  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = true
      bucket = "arul-terragrunt-example-prod-terraform-state"
      key = "${path_relative_to_include()}/terraform.tfstate"
      region = "us-west-1"
      lock_table = "terraform-locks"
    }
  }
}
