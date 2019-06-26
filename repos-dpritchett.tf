resource "github_repository" "dpritchett_repo_repo-config-management" {
  provider = "github.dpritchett"

  name        = "repo-config-management"
  description = "Using terraform to manage github orgs, teams, and repos."

  private = false

  has_downloads = true
  has_issues    = true
  has_wiki      = true
}
