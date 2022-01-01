class Order < ApplicationRecord

  belongs_to :customer
  has_many :cart_items

  enum payment_method: { credit_card: 0, transfer: 1 }

  def full_address
    '〒' + postal_code + ' ' + address
  end


end
