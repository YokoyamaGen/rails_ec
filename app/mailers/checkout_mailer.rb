# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  helper CheckoutHelper

  def creation_email(checkout)
    @checkout = checkout
    mail(
      subject: '注文内容ご確認（自動配信メール）',
      to: @checkout.email
    )
  end
end
