# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    Rails.env.development? ? origins('*') : origins(/.*\.?best-10\.co\.in/)

    resource '*', headers: :any, methods: %i[get post put patch delete options head]
  end
end
