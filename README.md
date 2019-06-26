# repo-config-management

Infrastructure-as-code configuration management for some of the public GitHub resources I administer.

## Why?

### Transparency and improved customer service outcomes

Managing non-sensitive GitHub configuration via terraform makes your GitHub settings viewable by users who don't need admin accounts. This makes for much quicker customer service and less time asking admin users to look things up.

**Before infrastructure-as-code**

> You: Hey Daniel what are the branch protections for branch X? I was hoping to ask you to change them.

> ... time passes ...

> Me: Oh it's set to 1 required approval.

> You: Oh. We need to set that to 2 approvals for security reasons. Can you please change it for me?

> ... time passes ...

> Me: Done!

> You: Ok great, thanks.

**After infrastructure-as-code**

([See this on a real PR!](https://github.com/dpritchett/repo-config-management/pull/1))

> You: Hey Daniel. Here's a PR raising the number of required approvals for `master` from 1 to 2 per our policy. It looks like this one branch was overlooked the last time we checked these. Please merge and apply this `terraform` change to sort it out.

> Me: Done, thanks!


### Detailed automated change auditing and rollbacks

**Before infrastructure-as-code**

> You: Hey Daniel. I noticed the `cool-hacks` repo has been set to read-only even though we still need to use it. Can you help me figure out why it was changed and help me make it writeable again?

> Me: Not sure what happened there. I think Bob was cleaning up some repos last month. I've gone ahead and made it writeable again.

> You: Thanks!

**After infrastructure-as-code**

> You: Hey Daniel. I need to push a change to the `cool-hacks` repo but it looks like Bob changed it to be read-only last month. Can you please merge and apply this PR to make it writeable again? Thanks!

> Me: Sure, no problem. Done.


## HOWTOS

- [Import an existing repo](./doc/import-resource.md)
- [Manage user membership to organizations and teams](doc/manage-memberships.md)
- [Change the name of a terraform resource](doc/rename-tf-resource.md)
