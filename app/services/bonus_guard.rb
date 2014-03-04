module BonusGuard
  extend self

  def validate(product, bonus_code)
    bonus_strategy = get_strategy(product.bonus_storage)
    return :missing unless bonus_strategy.bonus_exists?(product, bonus_code)

    status_strategy = get_strategy(product.status_storage)
    status_strategy.bonus_sold?(product, bonus_code) ? :valid : :invalid
  end

  private

  def get_strategy(key)
    case key
    when 'tv' then TVStrategy
    else
      DBStrategy
    end
  end
end
