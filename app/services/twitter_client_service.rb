class TwitterClientService < Twitter::REST::Client
  def initialize(token: nil, secret: nil)
    @client = super do |config|
      config.consumer_key        = TWITTER_API_KEY
      config.consumer_secret     = TWITTER_API_SECRET
      config.access_token        = token
      config.access_token_secret = secret
    end
  end

  def all_follower_ids
    current_cursor = -1
    ids = []
    unless current_cursor.zero?
      response = follower_ids(cursor: current_cursor)
      ids += response.attrs[:ids]
      current_cursor = response.attrs[:next_cursor]
    end
    ids
  end
end
