class HomesController < ApplicationController

  def top
    @items = Item.all
    @items = Item.all.order(created_at: :desc)
  end

  def about
  end

end