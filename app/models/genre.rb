class Genre < ApplicationRecord

  has_many :products
  enum status: { 有効: true, 無効: false }

end
