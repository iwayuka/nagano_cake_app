class CartItem < ApplicationRecord

    belongs_to :customer
    belongs_to :item
    belongs_to :order

    def subtotal
      item.with_tax_price * amount
    end


end
