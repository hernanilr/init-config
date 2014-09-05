require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fdbr
  class Application < Rails::Application
        # Prevent this deprecation message: https://github.com/svenfuchs/i18n/commit/3b6e56e
    I18n.enforce_available_locales = false

    
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale=:de
    config.i18n.default_locale = :'pt-BR'
    config.i18n.available_locales = [:'pt-BR']
    config.i18n.locale = :'pt-BR'

    config.action_mailer.default_url_options = { host: 'loja.casadosquadros.com.br' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.raise_delivery_errors = true 
    config.action_mailer.smtp_settings = { 
      address: 'smtp.mandrillapp.com',
      port: 587,
      domain: 'casadosquadros.com.br',
      enable_starttls_auto: true,
      authentication:  :plain,
      user_name: ENV['FDSMTP'],
      password: ENV['FDSMTP_PASSWORD']
      }

  end
end
