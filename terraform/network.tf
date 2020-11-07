locals {
    environment = "atlantis-test"
    vpc = {
        cidr = "10.1.0.0/16"
    }
}

resource "aws_vpc" "main" {
  cidr_block = local.vpc.cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    environment = local.environment
  }
}

