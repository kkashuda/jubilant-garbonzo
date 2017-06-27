require 'pry'

class CommentsController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]

  def new
  	binding.pry
  	@user = current_user 
  	@comment = Comment.new 
  	respond_to do |f| 
  		f.js
  	end  
  end 



  private 

  def comment_params
  	params.require(:comment).permit(:content, :title, :id, :username)
  end 
end
