class Account::ProductsController < ApplicationController
    before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  # account/products/1 GET
  def show
    # @product = Product.find(params[:id])
    unless @product 
      render plain: "Page not found", status: 404
    end
  end
  # POST
  def add_to_cart 
    @cart = current_user.cart || current_user.create_cart
    @cart.products << find_product
    @cart.after_save :method
    redirect_to products_path(find_product)
    #@order = current_user.orders.active.last || current_user.orders.new(status: "active")
    #@order.products << find_product
    #@order.save
    #redirect_to products_path(find_product)
  end
  private

  def product_params
    params.require(:product).permit!
  end 
    
  def find_product
    @product = Product.where(id: params[:id]).first
    render_404 unless @product
  end
end
