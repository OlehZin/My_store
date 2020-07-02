class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def finish #POST
    @order = current_user.orders.active.find(id)
    @order.finish
    redirect_to :root_path
  end

end
