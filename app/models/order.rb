class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :address
  
  enum payment_method: { credit_card: 0, transfer: 1 }


end
