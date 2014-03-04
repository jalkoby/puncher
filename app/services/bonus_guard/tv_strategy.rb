require 'net/http'

module BonusGuard::TVStrategy
  extend self

  def bonus_exists?(product, code)
    get_info(code).present?
  end

  def bonus_sold?(product, code)
    info = get_info(code)
    info && info['actor'] == product.name
  end

  private

  def get_info(code)
    uri = URI("https://github.com/#{ code }.json")
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body).first if res.is_a?(Net::HTTPSuccess)
  end
end
