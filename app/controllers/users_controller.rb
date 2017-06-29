class UsersController < ApplicationController

  def index 
    @total = current_user.pins.total(current_user)
    @username = User.username(current_user.email) 
  end 

  def show 
  	binding.pry
  end 
  
  
  private 
  def user_params 

  end 


end
