# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'logger'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.time_zone = 'Asia/Tokyo'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
      g.factory_bot false
    end
    config.action_view.default_form_builder = 'ApplicationFormBuilder'
  end
end
