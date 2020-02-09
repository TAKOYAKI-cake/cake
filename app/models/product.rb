class Product < ApplicationRecord


has_many :orderd_products
has_many :cart_items
belongs_to :genre
belongs_to :orderd_product

end
