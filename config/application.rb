require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'braintree'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Park
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "wwxfh2cjf7pfmy3h"
    Braintree::Configuration.public_key = "38rn52mnmhhsrk7t"
    Braintree::Configuration.private_key = "e260cd35fbf258819052c4c5e5cab5c5"
  end
end
