class Admin < ApplicationController
  
  before_action :authenticate_user!, :is_admin?
  
  def index
    @users = User.all 
	end

	def show
    @user = find_user
	end

  def edit 
    @user = find_user
  end

  def create
    @user = User.create(user_params)
    redirect_to products_path
  end

  def update
    @user = find_user
    redirect_to products_path(@product) if @user.update_attributes(user_params)
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def find_user
    
    #binding.pry
    
    User.find(params[:id])
  end  
  
end
