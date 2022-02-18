resource "sentry_project" "kikulabo-project" {
  organization = data.sentry_organization.org_kikulabo.id
  team         = sentry_team.kikulabo-team.slug
  name         = "kikulabo-project-new"
}