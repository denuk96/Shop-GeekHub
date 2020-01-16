class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail to: user.email, subject: t('mailer.user.subject')
  end
end
