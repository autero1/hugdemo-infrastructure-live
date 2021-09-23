terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//app/site?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env              = local.environment_vars.locals.environment
}

dependency "alb" {
  config_path = "../../networking/api-alb"
}

dependency "api" {
  config_path = "../pet-api"
}

inputs = {
  name                 = "pet-website"
  api_url              = "http://${dependency.alb.outputs.lb_dns_name}${dependency.api.outputs.api_path}"
  create_random_suffix = true
}
