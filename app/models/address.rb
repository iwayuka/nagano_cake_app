class Address < ApplicationRecord

  has_many :orders, dependent: :destroy

end
