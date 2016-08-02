class User < ApplicationRecord
  has_many  :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :fullname, presence: true, length: {maximum: 50}
end
