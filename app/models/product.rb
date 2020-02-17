class Product < ApplicationRecord
  belongs_to :genre, optional: true
  has_many :cart_items
  has_many :orderd_products
  enum sales_status: { 販売中: 0, 販売停止中: 1 }

  attachment :image

  def in_cart?(customer)
    cart_items.where(customer_id: customer.id).exists?
  end

end
