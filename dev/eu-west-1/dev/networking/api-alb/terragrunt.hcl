terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//networking/alb?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc"
}

inputs = {
  name           = "api"
  vpc_subnet_ids = dependency.vpc.outputs.public_subnets
  vpc_id         = dependency.vpc.outputs.vpc_id

  allow_connections_from_cidr_blocks = ["0.0.0.0/0"]
}
