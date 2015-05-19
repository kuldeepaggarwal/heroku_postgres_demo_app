class User < ActiveRecord::Base
  # Validations
  validates :email, presence: true, on: :update

  # Associations
  has_many :activities, dependent: :destroy

  # Callbacks
  after_create :create_follower_activity
  after_touch :send_unfollowed_users_notification

  # Class Methods
  def self.find_for_oauth(auth)
    user = where(twitter_id: auth.uid).first_or_initialize
    user.token  = auth.credentials.token
    user.secret = auth.credentials.secret
    user.save if user.changed?
    user
  end

  def self.process_follower_activity
    find_each do |user|
      user.send(:create_follower_activity)
      user.touch if user.requires_unfollowed_users_notification?
    end
  end

  # Instance Methods
  def follower_ids
    twitter_client.all_follower_ids
  end

  def requires_unfollowed_users_notification?
    updated_at >= 1.week.ago
  end

  def unfollowed_users(ago: 1.week.ago)
    unfollower_ids = activities.followers.on(ago).collect(&:entity_ids).flatten.map!(&:to_i) - follower_ids
    unfollower_ids.present? ? twitter_client.users(unfollower_ids) : []
  end

  private
    def create_follower_activity
      activities.followers.create(entity_ids: follower_ids)
    end

    def send_unfollowed_users_notification
      UserNotifier.send_unfollowed_users_notification(email, unfollowed_users).deliver if email?
    end

    def twitter_client
      @twitter_client ||= TwitterClientService.new(token: token, secret: secret)
    end
end
