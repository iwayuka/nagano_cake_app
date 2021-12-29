class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

    def create
    # １. データを新規登録するためのインスタンス作成
    cart_item = CartItem.new(cart_item_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
      # ３. 商品詳細画面へリダイレクト ※データの保存がうまくできるか確認のため、一度一覧画面へリダイレクト
    else
      cart_item.save
      # ３. 商品詳細画面へリダイレクト ※データの保存がうまくできるか確認のため、一度一覧画面へリダイレクト
      redirect_to cart_items_path
    end
  end


  private
  # ストロングパラメータ
  def cart_item_params
  params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end



end


