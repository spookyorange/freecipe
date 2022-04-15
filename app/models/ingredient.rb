class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, presence: true, length: { minimum: 3, maximum: 16 }

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
