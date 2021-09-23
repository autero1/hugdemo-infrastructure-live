terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//networking/vpc?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env  = local.environment_vars.locals.environment
  cidr = local.environment_vars.locals.vpc_cidr
}

inputs = {
  name = local.env
  cidr = local.cidr
}
