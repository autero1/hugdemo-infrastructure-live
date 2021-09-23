terraform {
  source = "git::git@github.com:autero1/hugdemo-infrastructure-modules.git//security/cmk?ref=v0.1.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name                 = "cmk"
  create_random_suffix = true
}
