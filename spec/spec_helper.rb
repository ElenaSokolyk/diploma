ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
# require 'capybara/email/rspec'
#require 'capybara/rspec'
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run focus: true
  config.mock_with :rspec
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers

  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  # --seed 1234
  config.order = 'random'

  Capybara.javascript_driver = :webkit

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
  end

  config.before :each do
    FactoryGirl.reload
    DatabaseCleaner.strategy = example.metadata[:js] || example.metadata[:clean] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.append_after :each do
    DatabaseCleaner.clean
  end
end
