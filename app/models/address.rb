class Address < ApplicationRecord

	belongs_to :customer

  validates :customer_id, presence: true
  validates :post_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

  def name_address
    post_code + shipping_address + shipping_name
  end

end
