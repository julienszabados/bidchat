require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bidchat
  class Application < Rails::Application
    config.active_record.logger = nil
    config.load_defaults 5.2
    config.time_zone = 'Paris'
#    config.i18n.default_locale = :fr
    config.assets.quiet = true
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders', '*')]
    config.autoload_paths += Dir[Rails.root.join('lib', '*')]
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'classes', '{**/}')]
  end
end
