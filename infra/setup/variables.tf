variable "tf_state_bucket" {
  description = "The name of the S3 bucket to store Terraform state files"
  default     = "ptr-usa-tf-tes"
}

variable "tf_state_lock_table" {
  description = "The name of the DynamoDB table for state locking"
  default     = "ptr-usa-centra-test-terraform-lock"
}

variable "project" {
  description = "value of the project"
  default     = "ptr-usa-centra-test"
}

variable "contact" {
  description = "value of the contact name"
  default     = "tf@tf.com"
}
