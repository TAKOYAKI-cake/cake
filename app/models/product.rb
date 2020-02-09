class Product < ApplicationRecord

belongs_to :genres
has_many :cart_items

end
