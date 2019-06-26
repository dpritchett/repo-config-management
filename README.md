# Manage and configure GitHub repositories and user acccess with Terraform

Infrastructure-as-code configuration management for some of the public GitHub resources I administer.

![screenshot of terraform code for managing team access to a repository and branch protections](img/terraform-code-sample.png) 

## Big Reasons for Managing Repositories with Code

### 1. Transparency and improved customer service outcomes

Managing non-sensitive GitHub configuration via terraform makes your GitHub settings viewable by users who don't need admin accounts. This makes for much quicker customer service and less time asking admin users to look things up.

#### Scenario: Non-admin user wants to tweak branch protections

##### Before infrastructure-as-code

> You: Hey Daniel what are the branch protections for branch X? I was hoping to ask you to change them.

> ... time passes ...

> Me: Oh it's set to 1 required approval.

> You: Oh. We need to set that to 2 approvals for security reasons. Can you please change it for me?

> ... time passes ...

> Me: Done!

> You: Ok great, thanks.

##### After infrastructure-as-code

You see the problem, locate the relevant config file, and submit a documented PR requesting the change.

I merge the PR and apply the change locally using the privileged access you don't need.

[![Screenshot of PR #1](img/raise-approver-count.png)](https://github.com/dpritchett/repo-config-management/pull/1)

([Link to PR](https://github.com/dpritchett/repo-config-management/pull/1))

### 2. Detailed automated change auditing and rollbacks

When all of your config changes are done through a `git` repo, tracking who changed what (and when, and why) becomes very straightforward. This makes for more empowered and informed end users.

#### Scenario: Non-admin user wants to make a repository writeable for their user group

##### Before infrastructure-as-code

> You: Hey Daniel. I noticed the `cool-hacks` repo has been set to read-only even though we still need to use it. Can you help me figure out why it was changed and help me make it writeable again?

> Me: Not sure what happened there. I think Bob was cleaning up some repos last month. I've gone ahead and made it writeable again.

> You: Thanks!

##### After infrastructure-as-code

You see the problem, click through to figure out who introduced it and when, and submit a documented PR to correct it.

I merge the PR and apply the change locally using the privileged access you don't need.

[![Screenshot of PR #2](img/make-repo-writeable.png)](https://github.com/dpritchett/repo-config-management/pull/2)

([Link to PR](https://github.com/dpritchett/repo-config-management/pull/2))

### 3. Centralized tracking of membership and access levels

#### Scenario: New user joins the team and needs to be granted appropriate GitHub access

##### Before infrastructure-as-code

> You, via email: Hey Daniel. Sean has recently agreed to join our team and we'd like to get him set up with access to our GitHub organization. Can you set that up for us?

> Me: Done! Welcome, Sean!

... ten minutes later ...

> You: Hey Daniel. It looks like Sean's been added to our GitHub org, thank you. He also needs to be a member of the `developers` team. I forgot to mention that!

... two minutes later ...

> Me: No problem! Added.

##### After infrastructure-as-code

On Sean's first day you pair with him on building and submitting the PR that grants his acccess to the organization and to relevant GitHub teams.

I merge the PR and apply the change locally using the privileged access you don't need.

[![Screenshot of PR #3](img/add-new-user.png)](https://github.com/dpritchett/repo-config-management/pull/3)

([Link to PR](https://github.com/dpritchett/repo-config-management/pull/3))

## HOWTOS

- [Import an existing repo](./doc/import-resource.md)
- [Manage user membership to organizations and teams](doc/manage-memberships.md)
- [Change the name of a terraform resource](doc/rename-tf-resource.md)
