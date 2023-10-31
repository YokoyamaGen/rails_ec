# frozen_string_literal: true

class CheckoutMailer < ApplicationMailer
  helper CartsHelper

  def creation_email(checkout, checkout_products)
    @checkout = checkout
    @checkout_products = checkout_products
    mail(
      subject: '注文内容ご確認（自動配信メール）',
      to: @checkout.email
    )
  end
end
