require_relative 'boot'

require "rails"
# Pick only what you need:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "active_storage/engine"

Bundler.require(*Rails.groups)

module TradingApplication
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true
    config.active_storage.service = :local
  end
end
