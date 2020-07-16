class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: [:add_to_cart]
  
  def index
    unless current_user.role == "admin"
      @products = Product.all
    else
      redirect_to :root
    end
  end
  
  def show
    resource
    unless @product 
      render plain: "Page not found", status: 404
    end
  end

  # POST
  def add_to_cart 
    @cart = current_user.cart || current_user.create_cart
    @cart.products << resource
    @cart.save
    flash[:notice]= "Added to the cart!"
    redirect_to products_path
  end

  private

  def resource
    @product = Product.find(params[:id])
  end 
end
