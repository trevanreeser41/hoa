Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8081', 'localhost:19006' # Add your Expo development server origin

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
