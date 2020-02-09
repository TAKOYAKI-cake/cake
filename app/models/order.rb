class Order < ApplicationRecord
  has_many :orderd_products
  belongs_to :customer
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum status: { クレジットカード: 'card', 銀行振込: 'bank' }
end

