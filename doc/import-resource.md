# repo-config-management

## Import an existing repo

1. Add the repo as a new resource in a `.tf` file:
```hcl
# ./memphis-ruby.tf

terraform {
  terraform_version = "0.11.14"
}

provider "github" {
  organization = "MemphisRuby"
}

resource "github_repository" "memphis_ruby_api" {
  name = "memphis_ruby_api"
}
```

2. Import the resource at the CLI

Format: `terraform import resource_name repo_slug`

```console
> terraform import github_repository.memphis_ruby_api memphis_ruby_api
github_repository.memphis_ruby_api: Importing from ID "memphis_ruby_api"...
github_repository.memphis_ruby_api: Import complete!
  Imported github_repository (ID: memphis_ruby_api)
github_repository.memphis_ruby_api: Refreshing state... (ID: memphis_ruby_api)

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

3. Run `terraform plan` to see what additional config you'll need to transcribe to your new `.tf` file:

```console
terraform plan

[cut a few noisy log lines here]... 

  ~ github_repository.memphis_ruby_api
      description:   "Sinatra proxy for Meetup's feed of our local tech user group calendars" => ""
      has_downloads: "true" => "false"
      has_issues:    "true" => "false"
      has_wiki:      "true" => "false"
      homepage_url:  "api.memphisruby.org" => ""


Plan: 0 to add, 1 to change, 0 to destroy.
```

4. Add config to catch up to the live state.

```tf
resource "github_repository" "memphis_ruby_api" {
  name = "memphis_ruby_api"

  homepage_url = "api.memphisruby.org"
  description = "Sinatra proxy for Meetup's feed of our local tech user group calendars"

  has_downloads = "true"
  has_issues = "true"
  has_wiki = "true"
}
```

5. Confirm there is no diff and then commit your `.tf` change.

```console
> terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

github_repository.memphis_ruby_api: Refreshing state... (ID: memphis_ruby_api)

------------------------------------------------------------------------

No changes. Infrastructure is up-to-date.
```