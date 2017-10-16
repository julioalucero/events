class NotificationsMailer < ApplicationMailer
  def match_event(event, user_id)
    @event = event
    user = User.find(user_id)

    mail to: user.email,
         subject: t('notifications_mailer.match_event.subject')
  end
end
