class Product < ActiveRecord::Base
  has_many :bonuses, :class_name => 'Bonus'
end
