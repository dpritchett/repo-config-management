# Add a user to an organization

Docs: https://www.terraform.io/docs/providers/github/r/membership.html

Example: 

```tf
resource "github_membership" "dpritchett" {
       username = "dpritchett"
       role = "admin"
}
```

# Add a user to a team
