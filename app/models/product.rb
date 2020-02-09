class Product < ApplicationRecord

  belongs_to :genres
  has_many :cart_items
  enum status: { 販売中: 0, 販売停止中: 1 }

end
