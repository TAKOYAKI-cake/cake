class Product < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items
  enum sales_status: { 販売中: 0, 販売停止中: 1 }

  attachment :image

end
