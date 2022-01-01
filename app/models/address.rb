class Address < ApplicationRecord

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
