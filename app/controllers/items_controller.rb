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
    cart_item.save
    # ３. 商品詳細画面へリダイレクト ※データの保存がうまくできるか確認のため、一度一覧画面へリダイレクト
    redirect_to items_path
  end

  private
  # ストロングパラメータ
  def cart_item_params
  params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end



end
