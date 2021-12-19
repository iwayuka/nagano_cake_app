class Genre < ApplicationRecord

  # genreモデルに対して、itemsモデルが1:Nになるよう関連付け
  has_many :items, dependent: :destroy

end
