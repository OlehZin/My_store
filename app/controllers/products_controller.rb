class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:edit, :update, :new, :create, :destroy]
  # before_action :find_product, only: [:show]
  
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

  # /products/new GET
  def new
    @product = Product.new
  end
  
  # /products/1/edit GET
  def edit
  end
  
  # /products POST
  def create
    @product = Product.create(product_params)
    if @product.errors.empty?
      flash[:success] = "Created!"
      redirect_to products_path(@product)
    else
      flash.now[:error] = "Incorrect!"
      render "new"
    end
  end


    # /products/1 PUT
  def update
    @product.update_attributes(product_params)
      if @product.errors.empty?
        flash[:success] = "Updated!"
        redirect_to products_path(@product)
      else
        flash.now[:error] = "Incorrect!"
        render "edit"
      end
  end
  # /products/1 DELETE
  def destroy
    @product.destroy
    redirect_to action: "index"
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
