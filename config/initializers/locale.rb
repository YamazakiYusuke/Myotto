I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
I18n.config.available_locales = [:en, :ja, :ru]
I18n.default_locale = :ru
