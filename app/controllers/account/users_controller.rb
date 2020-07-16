class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  
  def index
    @users = User.all 
	end

	def show
    @user = resource
	end

  def edit 
    @user = resource
  end

  def create
    @user = User.create(user_params)
    redirect_to products_path
  end

  def update
    @user = resource
    redirect_to products_path(@product) if @user.update_attributes(user_params)
  end
  
  def destroy
    resource
    @user.destroy
    redirect_to action: "index"
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def resource
    @user = User.find(params[:id])
  end  
end
