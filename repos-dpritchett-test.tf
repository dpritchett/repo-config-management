resource "github_repository" "dpritchett-test_repo_demo-repo" {
  provider = "github.dpritchett-test"

  name        = "demo-repo"
  description = "Demo repository for managing GitHub via Terraform"

  private = false
}

resource "github_team_repository" "dpritchett-test_team_repository_demo-repo_developers" {
  provider = "github.dpritchett-test"

  team_id    = "${github_team.dpritchett-test-developers.id}"
  repository = "${github_repository.dpritchett-test_repo_demo-repo.name}"
  permission = "push"
}

resource "github_branch_protection" "protect-demo-repo-master" {
  provider = "github.dpritchett-test"

  repository = "${github_repository.dpritchett-test_repo_demo-repo.name}"
  branch     = "master"

  enforce_admins = true

  required_pull_request_reviews {
    required_approving_review_count = 2
    dismiss_stale_reviews           = true
  }

  # no one can push without passing these restrictions
  restrictions {}
}

resource "github_repository" "dpritchett-test_repo_cool-hacks" {
  provider = "github.dpritchett-test"

  name        = "cool-hacks"
  description = "Cool hacks to amaze your friends"

  private = false
}

resource "github_team_repository" "dpritchett-test_team_repository_cool-hacks" {
  provider = "github.dpritchett-test"

  team_id    = "${github_team.dpritchett-test-developers.id}"
  repository = "${github_repository.dpritchett-test_repo_cool-hacks.name}"
  permission = "pull"
}
