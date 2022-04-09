class Profile < ApplicationRecord
  belongs_to :user
  has_many :recipes

  validates :username, presence: true, length: { minimum: 6, maximum: 18 }, uniqueness: true
end
