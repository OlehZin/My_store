class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end
  
  def finish #POST
    @order = current_user.orders.active.find(id)
    @order.finish
    redirect_to :root_path
  end

end
