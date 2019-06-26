terraform {
  terraform_version = "0.11.14"
}

provider "github" {
  organization = "dpritchett-test"
  alias        = "dpritchett-test"
}

resource "github_membership" "dpritchett-test-dpritchett" {
  provider = "github.dpritchett-test"

  username = "dpritchett"
  role     = "admin"
}

resource "github_team" "dpritchett-test-developers" {
  provider = "github.dpritchett-test"

  description = "Developers of dpritchett-test repos"
  name        = "developers"
  privacy     = "closed"
}

resource github_team_membership "dpritchett-test-developers-dpritchett" {
  provider = "github.dpritchett-test"

  username = "dpritchett"
  team_id  = "${github_team.dpritchett-test-developers.id}"

  role = "maintainer"
}

resource "github_membership" "dpritchett-test-kitschysynq" {
  provider = "github.dpritchett-test"

  username = "kitschysynq"
  role     = "member"
}

resource github_team_membership "dpritchett-test-developers-kitschysynq" {
  provider = "github.dpritchett-test"

  username = "${github_membership.dpritchett-test-kitschysynq.username}"
  team_id  = "${github_team.dpritchett-test-developers.id}"

  role = "member"
}
