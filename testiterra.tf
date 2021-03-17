terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}




locals {
  hidgroups = compact(split("\n", file("./newhids.txt") ))
}


output "hidgroups" {
  value = local.hidgroups
}

resource "aws_iam_group" "developers" {
    for_each =toset(local.hidgroups)
       name = each.value

}


