class OrderMailer < ApplicationMailer
  def confirmation(order)
    @order = order
    mail to: order.user.email, subject: 'You order created. GeekHub Shop'
  end
end
