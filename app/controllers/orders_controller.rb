class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    order = Order.new(order_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    order.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
