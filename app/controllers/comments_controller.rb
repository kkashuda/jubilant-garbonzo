class CommentsController < ApplicationController
  def new
  	@user = current_user 
  	@comment = Comment.new  
  end 

  


  private 

  def comment_params
  	params.require(:comment).permit(:content, :title, :id, :username)
  end 
end
