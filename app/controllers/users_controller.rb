class UsersController < ApplicationController
  
  before_action :authenticate_user!
  #  before_action :is_admin?
  
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
  
  def destroy
    find_user
    @user.destroy
    redirect_to action: "index"
  end
  
  private

  def user_params
    params.require(:user).permit!
  end

  def find_user
    User.find(params[:id])
  end  
  
end
