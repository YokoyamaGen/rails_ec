# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all

  def display_image
    if object.image.attached?
      object.image
    else
      'noimage.jpg'
    end
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
