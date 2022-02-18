
resource "sentry_rule" "kikulabo-rule" {
  organization = data.sentry_organization.org_kikulabo.id
  name         = "test-rule-new-new"
  project      = sentry_project.kikulabo-project.slug
  action_match = "all"
  filter_match = "all"
  frequency    = 30
  environment  = "production"
  conditions = [
    {
      "id" : "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition",
      "name" : "A new issue is created"
    },
    {
      "id" : "sentry.rules.conditions.reappeared_event.ReappearedEventCondition",
      "name" : "The issue changes state from ignored to unresolved"
    },
    {
      "comparisonType" : "count",
      "id" : "sentry.rules.conditions.event_frequency.EventFrequencyCondition",
      "interval" : "1m",
      "name" : "The issue is seen more than 10 times in 1m",
      "value" : 10
    }
  ]
  filters = [
    {
      "comparison_type" : "newer",
      "id" : "sentry.rules.filters.age_comparison.AgeComparisonFilter",
      "name" : "The issue is newer than 10 minute",
      "time" : "minute",
      "value" : 10
    },
    {
      "id" : "sentry.rules.filters.issue_occurrences.IssueOccurrencesFilter",
      "name" : "The issue has happened at least 6 times",
      "value" : 6
    },
    {
      "attribute" : "platform",
      "id" : "sentry.rules.filters.event_attribute.EventAttributeFilter",
      "match" : "eq",
      "name" : "The event's platform value equals 10",
      "value" : "10"
    }
  ]
  actions = [
    {
      "id" : "sentry.mail.actions.NotifyEmailAction",
      "name" : "Send a notification to IssueOwners",
      "targetType" : "IssueOwners",
      "targetIdentifier" : ""
    },
    {
      "id" : "sentry.rules.actions.notify_event.NotifyEventAction",
      "name" : "Send a notification (for all legacy integrations)"
    }
  ]
}