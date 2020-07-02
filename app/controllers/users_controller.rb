class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = find_user
  end
  
  private
  
  def user_params
    params.require(:user).permit!
  end

  def find_user
    User.find(params[:id])
  end  
end

