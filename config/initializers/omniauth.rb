Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 'narwhal.iamaust.in', 'eSbvoAUx1ooLEkYreC3yUrhi', {}
end
