class AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses.all
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

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path
  end


  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private
  # ストロングパラメータ
  def address_params
  params.require(:address).permit(:customer_id, :name, :postal_code, :address)
end

end
