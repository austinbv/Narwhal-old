Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE_CONSUMER, GOOGLE_SECRET
end
