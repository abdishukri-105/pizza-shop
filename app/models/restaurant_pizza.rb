class RestaurantPizza < ApplicationRecord
  belongs_to :restaurant
  belongs_to :pizza

  validates :restaurant_id, presence: true
  validates :pizza_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 30 }
end
