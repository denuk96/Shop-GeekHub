class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail to: order.user.email, subject: t('mailer.order.subject')
  end

  def order_updated(order)
    @order = order
    mail to: order.user.email, subject: 'Order updated'
  end

  def status_changed(order)
    @order = order
    mail to: order.user.email, subject: 'Status changed'
  end
end
