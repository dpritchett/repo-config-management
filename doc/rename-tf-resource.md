## Why?

Sometimes you find that your first guess at a good name for a `.tf` resource won't fly.

Earlier I added a `github_membership` called `dpritchett`. As soon as I went to add myself to a second organization I was rejected with an error that said, roughly: "resource dpritchett already exists".

Then I realized I needed to rename the `dpritchett` membership resource to `memphis-ruby-dpritchett`. (`memphis-ruby` being the org name that I had already linked my `dpritchett` account to.)

## 1. Rename the resource in your `.tf` config:

```console
git add -p org-memphis-ruby.tf
diff --git a/org-memphis-ruby.tf b/org-memphis-ruby.tf
index 2d43c05..7951403 100644
--- a/org-memphis-ruby.tf
+++ b/org-memphis-ruby.tf
@@ -17,7 +17,7 @@ resource "github_repository" "memphis_ruby_api" {
 	has_wiki = "true"
 }

-resource "github_membership" "dpritchett" {
+resource "github_membership" "memphis_ruby-dpritchett" {
 	username = "dpritchett"
 	role = "admin"
 }
 ```

##  2. Update your terraform state to match with `terraform state mv`:

 ```console
 terraform state mv github_membership.dpritchett github_membership.memphis_ruby-dpritchett
Moved github_membership.dpritchett to github_membership.memphis_ruby-dpritchett
```

## Done!
