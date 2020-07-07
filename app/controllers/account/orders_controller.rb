class Account::OrdersController < ApplicationController
  
  def show
    @order = current_user.cart
  end

  
end
