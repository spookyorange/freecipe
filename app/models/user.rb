class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes

  validates :username, presence: true, length: { minimum: 4, maximum: 16 }
  validates :password, presence: true, length: { minimum: 8 }
end
