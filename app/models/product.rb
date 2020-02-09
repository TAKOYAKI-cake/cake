class Product < ApplicationRecord

belongs_to :genres
has_many :orderd_products

end
