class User < ActiveRecord::Base

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth[:uid])

    user.uid                = auth.uid
    user.name               = auth.extra.raw_info.name
    user.screen_name        = auth.extra.raw_info.screen_name
    user.oauth_token        = auth.credentials.token
    user.oauth_token_secret = auth.credentials.secret

    user.save
    user
  end

end
