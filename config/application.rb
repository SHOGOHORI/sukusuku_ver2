require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Sukusuku
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.generators.template_engine = :slim
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework :rspec,
                       helper_specs: false,
                       routing_specs: false
    end
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end

module Bookers2Debug
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja # 追記
  end
end
