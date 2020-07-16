class Account::OrdersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @orders = current_user.role == "admin" ? Order.all : current_user.orders
  end

  def show
    resource
  end
  
  def destroy
    resource
    @order.destroy
    redirect_to action: "index"
  end
  
  private

  def resource
    @order = Order.find(params[:id])
  end
end
