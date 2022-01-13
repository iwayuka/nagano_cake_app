class CustomersController < ApplicationController
  
  before_action :authenticate_customer!

  def mypage
    @customer = Customer.find(current_customer.id)

  end

  def edit
    # findメソッドを用いて、データの取得
    @customer = Customer.find(current_customer.id)

  end

  def update
  # 編集内容を送信し、データベースに保存・反映するアクションの作成
  customer = Customer.find(current_customer.id)
  customer.update(customer_params)
  #リダイレクト先は、ジャンル一覧へ
  redirect_to customers_mypage_path
  end

  def unsubscribe
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end




private
# ストロングパラメータ
def customer_params
  params.require(:customer).permit(:email, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
end

end
