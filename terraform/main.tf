terraform {
 required_providers {
   aws = {
      source = "hashicorp/aws"
      version = "2.43.0"
    }
 }
 
 backend "s3" {
   bucket  = "my-terraform-state-bucket-101"
   region = "us-east-1"
   key    = "terraform.tfstate"
   encrypt = true
 }
}
 
provider "aws" {
 region = "us-east-1"
}
 
resource "aws_instance" "test_instance" {
 ami           = "ami-830c94e3"
 instance_type = "t2.nano"
 tags = {
   Name = "test_instance"
 }
}