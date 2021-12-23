class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

   private
  # ストロングパラメータ
  def cart_item_params
  params.require(:cart_item).permit(:item_id, :customer, :amount)
  end


end
