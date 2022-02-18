
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "kikuchi-test"

    workspaces {
      name = "sentry-test"
    }
  }
}

# Configure the Sentry Provider
provider "sentry" {
  token = var.sentry_token
}

data "sentry_organization" "org_kikulabo" {
  slug = "kikulabo"
}
