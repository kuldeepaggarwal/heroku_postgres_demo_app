# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/send_unfollowed_users_notification
  def send_unfollowed_users_notification
    UserNotifier.send_unfollowed_users_notification
  end

end
