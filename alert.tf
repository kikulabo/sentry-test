resource "sentry_rule" "kikulabo-rule-1" {
  organization = data.sentry_organization.org_kikulabo.id
  name         = "kikulabo-rule-1"
  project      = sentry_project.kikulabo["kikulabo-pj-1"].slug
  action_match = "all"
  filter_match = "all"
  frequency    = 30
  environment  = "production"
  conditions = [
    {
      "id" : "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition",
      "name" : "A new issue is created"
    }
  ]
  actions = [
    {
      "id" : "sentry.mail.actions.NotifyEmailAction",
      "name" : "Send a notification to IssueOwners",
      "targetType" : "IssueOwners",
      "targetIdentifier" : ""
    }
  ]
}

resource "sentry_rule" "kikulabo-rule-2" {
  organization = data.sentry_organization.org_kikulabo.id
  name         = "kikulabo-rule-2"
  project      = sentry_project.kikulabo["kikulabo-pj-2"].slug
  action_match = "all"
  filter_match = "all"
  frequency    = 30
  environment  = "production"
  conditions = [
    {
      "id" : "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition",
      "name" : "A new issue is created"
    }
  ]
  actions = [
    {
      "id" : "sentry.mail.actions.NotifyEmailAction",
      "name" : "Send a notification to IssueOwners",
      "targetType" : "IssueOwners",
      "targetIdentifier" : ""
    }
  ]
}