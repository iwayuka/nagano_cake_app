class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    item = Item.new(item_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    item.save
    # ３. 商品詳細画面へリダイレクト ※データの保存がうまくできるか確認のため、一度一覧画面へリダイレクト
    redirect_to admin_items_path
  end

  def index
    # itemデータベースから情報を取得
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def item_params
  params.require(:item).permit(:genre_id, :name, :image_id, :introduction, :price, :is_active)
end

end
