class CustomersController < ApplicationController

  def mypage
    @customer = Customer.find(current_customer.id)

  end


end
