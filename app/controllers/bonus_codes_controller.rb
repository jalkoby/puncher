class BonusCodesController < ApplicationController
  def index
    @products = Product.all
  end

  def validate
    product = Product.find(params[:product_id])
    result = BonusGuard.validate(product, params[:bonus_code])
    case result
    when :valid
      head 200
    when :invalid
      head 403
    else
      head 404
    end
  end
end
