class CartsController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @cart = resource
  end

  def finish
    @cart = resource
    if  @cart.products.any?
        @order = current_user.orders.create
        @order.products << @cart.products
        @cart.products.clear
        @order.finish
    end
    flash[:notice]= "Thank you for Your successful choice!"
    redirect_to products_path
  end

  private

  def resource
    Cart.find(params[:id]) == current_user.cart ? current_user.cart : nil
  end
end
