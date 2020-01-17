class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail to: order.user.email, subject: t('mailer.order.subject')
  end

  def order_updated(order)
    @order = order
    mail to: order.user.email, subject: t('mailer.order.order_updated_subject')
  end

  def status_changed(order)
    @order = order
    mail to: order.user.email, subject: t('mailer.order.order_status_changed_subject')
  end
end
