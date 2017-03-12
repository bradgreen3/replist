Yt.configure do |config|
  config.api_key = ENV['youtube_api']
end

Yt.configuration.api_key = ENV['youtube_api']
