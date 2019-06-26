terraform {
  terraform_version = "0.11.14"
}

provider "github" {
  organization = "dpritchett-test"
}

resource "github_membership" "dpritchett" {
	username = "dpritchett"
	role = "admin"
}
