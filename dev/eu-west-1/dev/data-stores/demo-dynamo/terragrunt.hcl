terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//data-stores/dynamodb?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

dependency "cmk" {
  config_path = "../../../_global/cmk"
}

inputs = {
  name                               = "hugdemo"
  server_side_encryption_kms_key_arn = dependency.cmk.outputs.key_arn
  number_of_sample_items             = 5
}
