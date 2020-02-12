class Address < ApplicationRecord
	belongs_to :customer
  def name_address
    post_code + shipping_address + shipping_name
  end
end
