class YoutubeUser < ApplicationRecord

  def self.from_omniauth(auth_info, current_user)
    account = YoutubeService.new(nil, auth_info['credentials']['token']).get_account
    yt_user                = YoutubeUser.find_or_create_by(account_number: account.id)
    yt_user.token          = auth_info['credentials']['token']
    yt_user.user_id        = current_user
    yt_user.account_number = account.id
    yt_user.save!
    yt_user
  end

end
