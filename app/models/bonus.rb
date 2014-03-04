class Bonus < ActiveRecord::Base
  belongs_to :product

  scope :by_code, ->(value) { where(:code => value) }
  scope :sold, -> { where(:sold => true) }
end
