class User < ActiveRecord::Base

  def self.find_for_oauth(auth)
    user = where(twitter_id: auth.uid).first_or_initialize
    user.token  = auth.credentials.token
    user.secret = auth.credentials.secret
    user.save
    user
  end
end
