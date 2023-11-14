require File.expand_path('boot', __dir__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Dinnect
  class Application < Rails::Application
    config.load_defaults 7.1
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :utc
    config.eager_load_paths << Rails.root.join('lib')
    config.active_record.schema_format = :sql
    config.filter_parameters += [:password, :credit_card]
    config.assets.enabled = true

    # Uncomment if you want to enable the asset pipeline.
    # config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'

    # Fix for Heroku deploy
    config.assets.initialize_on_precompile = false
  end
end
