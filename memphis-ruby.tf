terraform {
  terraform_version = "0.11.14"
}

provider "github" {
  organization = "MemphisRuby"
}

resource "github_repository" "memphis_ruby_api" {
	name = "memphis_ruby_api"

	homepage_url = "api.memphisruby.org"
	description = "Sinatra proxy for Meetup's feed of our local tech user group calendars"

	has_downloads = "true"
	has_issues = "true"
	has_wiki = "true"
}
