namespace :users do
  desc 'It sends user a mail of users who had unfollowed him/her'
  task send_unfollowed_users_notification: :environment do
    User.process_follower_activity
  end

end
