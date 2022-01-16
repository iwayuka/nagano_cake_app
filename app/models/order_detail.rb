class OrderDetail < ApplicationRecord

    belongs_to :order
    belongs_to :item

  # enumで管理, {0: 着手不可, 1:製作待ち, 2: 製作中, 3: 製作完了}
  enum making_status: { not_startable: 0, wait: 1, production: 2, completion: 3 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
      with_tax_price * amount
  end



end
