# frozen_string_literal: true

class CheckoutProductDecorator < ApplicationDecorator
  delegate_all

  def display_image
    if object.image.attached?
      object.image
    else
      'noimage.jpg'
    end
  end

  def total_price(promotion_code)
    total_price = calc_total_price
    if promotion_code
      discount_price = total_price - promotion_code.discount_amount
      discount_price.negative? ? 0 : discount_price
    else
      total_price
    end
  end

  def calc_total_price
    object.price * object.quantity
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
