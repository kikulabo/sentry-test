resource "sentry_team" "kikulabo-team" {
  organization = data.sentry_organization.org_kikulabo.id
  name         = "kikulabo-new"
}
