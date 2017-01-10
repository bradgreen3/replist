Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['youtube_id'], ENV['youtube_secret'], scope: 'userinfo.profile,youtube'
end
