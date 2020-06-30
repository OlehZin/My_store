class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  # /products/1 GET
  def show
    # @product = Product.find(params[:id])
    unless @product 
      render plain: "Page not found", status: 404
    end
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
