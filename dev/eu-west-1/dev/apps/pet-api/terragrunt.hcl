terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//app/lambda?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

dependency "dynamo" {
  config_path = "../../data-stores/demo-dynamo"
}

dependency "vpc" {
  config_path = "../../vpc"
}

dependency "alb" {
  config_path = "../../networking/api-alb"
}

dependency "cmk" {
  config_path = "../../../_global/cmk"
}

inputs = {
  name                = "pet-api"
  dynamodb_table_name = dependency.dynamo.outputs.dynamodb_table_id
  vpc_subnet_ids      = dependency.vpc.outputs.private_subnets
  vpc_id              = dependency.vpc.outputs.vpc_id
  alb_listener_arn    = dependency.alb.outputs.http_listener_arn
  kms_key_arn         = dependency.cmk.outputs.key_arn
}

