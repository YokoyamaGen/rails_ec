# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def create
    @promotion_code = PromotionCode.find_by(code: params[:promotion_code][:code], checkout_product_id: nil,
                                            cart_id: nil)

    return if @promotion_code.nil? || current_cart.is_promotion_code

    @promotion_code.update!(cart_id: current_cart.id)
    current_cart.update!(is_promotion_code: true)
    redirect_to new_checkout_path
  end
end
