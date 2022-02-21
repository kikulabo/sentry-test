locals {
  project_map = [
    {
      project_name = "kikulabo-pj-1",
      team_name    = sentry_team.kikulabo["kikulabo-team-1"].slug,
      platform     = "go",
      resolve_age  = 0
    },
    {
      project_name = "kikulabo-pj-2",
      team_name    = sentry_team.kikulabo["kikulabo-team-2"].slug,
      platform     = "python",
      resolve_age  = 0
    },
  ]
}

resource "sentry_project" "kikulabo" {
  organization = data.sentry_organization.org_kikulabo.id
  for_each     = { for i in local.project_map : i.project_name => i }
  team         = each.value.team_name
  name         = each.value.project_name
  slug         = each.value.project_name
  platform     = each.value.platform
  resolve_age  = each.value.resolve_age
}
