// Configure default Terraform version and default providers
globals "terraform" {
  version     = ">= 1.12.0"
  version_dev = ">= 1.12.0"
}

globals "terraform" "providers" "btp" {
  version     = "~> 1.15.0"
  version_dev = "~> 1.15.0"
}
