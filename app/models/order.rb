class Order < ApplicationRecord
  has_many :orderd_products
  belongs_to :customer
  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  enum method_of_payment: { クレジットカード: 'card', 銀行振込: 'bank' }
  validates :postcode, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

end

