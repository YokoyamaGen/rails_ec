# frozen_string_literal: true

class CheckoutDecorator < ApplicationDecorator
  delegate_all

  def display_name
    "#{object.first_name}  #{object.last_name}"
  end

  def credit_card_number_part
    object.credit_card_number.slice(12, 4)
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
