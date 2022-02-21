locals {
  team_list = [
    "kikulabo-team-1",
    "kikulabo-team-2"
  ]
}

resource "sentry_team" "kikulabo" {
  organization = data.sentry_organization.org_kikulabo.id
  for_each     = toset(local.team_list)
  name         = each.key
  slug         = each.key
}
