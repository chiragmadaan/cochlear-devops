terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

# Configure the AWS Provider
provider "aws" {
  region  = "ap-southeast-2"
}


resource "aws_ecr_repository" "ecr" {
  name                 = "cochlear_task3"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "cochlear_policy" {
  repository = aws_ecr_repository.ecr.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Cochlear Policy",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::cochlear-account-id:root"
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:DescribeRepositories",
                "ecr:ListImages"
            ]
        }
    ]
}
EOF
}