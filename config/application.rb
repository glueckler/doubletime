# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DoubleTime
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # for JWT the contents of the lib directory have to be included
    # this doesn't work on heroku?
    # config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += %W[#{config.root}/lib]
    # try using eager_load_paths for heroku
    config.eager_load_paths += %W[#{config.root}/lib]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]

    # to always require anything in the app/commands dir
    config.autoload_paths += %W[#{config.root}/app/commands]
    config.eager_load_paths += %W[#{config.root}/app/commands]
    config.autoload_paths += Dir["#{config.root}/app/commands/**/"]
    config.eager_load_paths += Dir["#{config.root}/app/commands/**/"]
  end
end
