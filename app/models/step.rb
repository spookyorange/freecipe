class Step < ApplicationRecord
  belongs_to :recipe

  validates_presence_of :title, :description, :duration, :order

  validates :title, length: { minimum: 6, maximum: 18 }
  validates :description, length: { minimum: 15, maximum: 120 }
  validates :duration, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: 1,
                                               only_integer: true }
  validates :order, numericality: { greater_than_or_equal_to: 0, only_integer: true  }
end
