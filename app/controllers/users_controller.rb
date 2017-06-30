class UsersController < ApplicationController

  def index 
    @total = current_user.pins.total(current_user)
    @username = User.username(current_user.email) 
  end 

  def show 
  end 
  
  
  private 
  def user_params 
  	params.require(:user).permit(:id)
  end 

end
