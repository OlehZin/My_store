class Account::ProductsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :require_admin!
   
  def index
    @products = Product.all
  end
  
  # /products/1 GET
  def show
    resource
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
    resource
  end
  
  # /products POST
  def create
    @product = Product.create(product_params)
    if @product.errors.empty?
      flash[:success] = "Created!"
      redirect_to account_products_path
    else
      flash.now[:error] = "Incorrect!"
      render "new"
    end
  end
 
  # /products/1 PUT
  def update
    resource
    @product.update_attributes(product_params)
      if @product.errors.empty?
        flash[:success] = "Updated!"
        redirect_to action: "show"
      else
        flash.now[:error] = "Incorrect!"
        render "edit"
      end
  end
  
  # /products/1 DELETE
  def destroy
    resource
    @product.destroy
    flash[:success] = "Deleted!"
    redirect_to action: "index"
  end

  def image
    @items.image.attach(params[:image])
  end
  
  private

  def product_params
    params.require(:product).permit(:price, :name, :description, :image)
  end 
    
  def resource
    @product = Product.find(params[:id])
  end
end
