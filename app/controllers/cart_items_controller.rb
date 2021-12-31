class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  CartItem.destroy_all
  redirect_to cart_items_path
end

   private
  # ストロングパラメータ
  def cart_item_params
  params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end


end
