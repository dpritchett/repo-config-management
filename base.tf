terraform {
  terraform_version = "0.11.14"

  backend "local" {
    path = "./.tfstate"
  }
}
