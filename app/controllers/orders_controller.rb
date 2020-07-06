class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end
  # POST
  def finish 
    @order = current_user.create_order
    @order.products << current_user.cart.products
    current_user.cart.products.clear
    @order.finish
    redirect_to :root
  end

end
