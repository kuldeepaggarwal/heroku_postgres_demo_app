require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "send_unfollowed_users_notification" do
    mail = UserNotifier.send_unfollowed_users_notification
    assert_equal "Send unfollowed users notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
