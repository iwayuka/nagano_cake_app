class AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new

  end

  def create
    # １. データを新規登録するためのインスタンス作成
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
    address.save
    # ３. 商品詳細画面へリダイレクト ※データの保存がうまくできるか確認のため、一度一覧画面へリダイレクト
    redirect_to addresses_path
  end



  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])

    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end


  def destroy
  end

  private
  # ストロングパラメータ
  def address_params
  params.require(:address).permit(:name, :postal_code, :address)
end

end
