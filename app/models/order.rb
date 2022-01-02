class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  # enumで管理, {0: クレジットカード, 1: 銀行振込}
  enum payment_method: { credit_card: 0, transfer: 1 }

  # enumで管理, {0: 入金待ち, 1:入金確認, 2: 製作中, 3: 発送準備中, 4: 発送済み}
  enum status: { unpaid: 0, paid: 1, production: 2, ready_to_ship: 3, shipped: 4 }

  def full_address
    '〒' + postal_code + ' ' + address
  end


end
