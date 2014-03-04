module BonusGuard::DBStrategy
  extend self

  def bonus_exists?(product, code)
    product.bonuses.by_code(code).exists?
  end

  def bonus_sold?(product, code)
    product.bonuses.sold.by_code(code).exists?
  end
end
