class UserNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.send_unfollowed_users_notification.subject
  #
  def send_unfollowed_users_notification(email, users)
    @greeting = "Hi #{ email }!"
    @users = users

    mail to: email
  end
end
