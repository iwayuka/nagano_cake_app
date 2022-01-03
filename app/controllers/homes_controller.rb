class HomesController < ApplicationController

  def top
    #Top画面の新着商品情報を４件のみ表示、かつ新着順にする
    @items = Item.limit(4).order(created_at: :desc)
  end

  def about
  end

end