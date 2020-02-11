class Product < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items
  enum status: { 販売中: 0, 販売停止中: 1 }

  attachment :image

end
