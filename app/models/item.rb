class Item < ApplicationRecord
  belongs_to :user
  has_many :photos

  validates :item_type, presence: true
  validates :item_name, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
