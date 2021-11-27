class Item < ApplicationRecord

  # itemsモデルに対して、genreモデルが1:Nになるよう関連付け
  belongs_to :genre


end
