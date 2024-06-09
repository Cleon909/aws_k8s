terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "> 1.5"
        }
    }
}

provider "aws" {
    region = "eu-west-1"
}