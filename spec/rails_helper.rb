# frozen_string_literal: true
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

schema_json = `curl 'https://uchidataku.github.io/Best-10/Application.json'`
json_file = File.open('tmp/schema.json', 'w')
json_file.write(schema_json)
json_file.close

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Rails.application.routes.url_helpers
  config.include FactoryBot::Syntax::Methods
  config.include ActiveJob::TestHelper

  config.include Committee::Rails::Test::Methods
  config.add_setting :committee_options
  config.committee_options = {
    schema: Committee::Drivers.load_from_file('tmp/schema.json'),
    query_hash_key: 'rack.request.query_hash',
    parse_response_by_content_type: false
  }

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    Rails.application.load_seed
  end

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true unless meta.key?(:aggregate_failures)
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
