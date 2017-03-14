require 'rest-client'

class YoutubeUser < ApplicationRecord

  def refresh_token_if_expired
    if token_expired?
      response    = RestClient.post "https://www.googleapis.com/oauth2/v4/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['youtube_id'], :client_secret => ENV['youtube_secret']
      refreshhash = JSON.parse(response.body)

      token_will_change!
      expires_at_will_change!

      self.token     = refreshhash['access_token']
      self.expires_at = DateTime.now + refreshhash["expires_in"].to_i.seconds
      
      self.save
    end
  end

  def token_expired?
    expiry = Time.at(self.expires_at)
    return true if expiry < Time.now # expired token, return true
    token_expires_at = expiry
    save if changed?
    false # token not expired
  end

  def self.from_omniauth(auth_info, current_user)
    account = YoutubeService.new(nil, auth_info['credentials']['token']).get_account
    yt_user                = YoutubeUser.find_or_create_by(account_number: account.id)
    yt_user.token          = auth_info['credentials']['token']
    yt_user.refresh_token  = auth_info['credentials']['refresh_token']
    yt_user.expires_at     = Time.at(auth_info['credentials']['expires_at'])
    yt_user.user_id        = current_user
    yt_user.account_number = account.id
    yt_user.save!
    yt_user
  end

end
