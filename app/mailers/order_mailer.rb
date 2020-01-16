class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail to: order.user.email, subject: t('mailer.order.subject')
  end
end
