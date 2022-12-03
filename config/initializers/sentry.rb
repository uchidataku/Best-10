# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', '')
  config.breadcrumbs_logger = [:active_support_logger]
  config.send_default_pii = true
end
