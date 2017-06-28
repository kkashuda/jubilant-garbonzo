require 'pry'

class CommentsController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]


def index 
	@comments = Comment.all

end 

  def new
  	@user = current_user 
  	@comment = Comment.new 
  	respond_to do |f| 
  		f.js
  	end  
  end 

  def create
  	@comment = Comment.new 
  	@comment.pin_id = params[:pin_id]
  	respond_to do |format|
  	if @comment.save 
  		format.html {redirect_to pin_path(params[:pin_id]), notice: 'Comment was successfully created.'}
  		format.json {render action :show, status: :created, location: @comment}
  	else 
  		format.html {render action: 'new'}
  		format.json {render json: @comment.errors, status: :unprocessable_entity}
  	end 
  end
end  



  private 

  def comment_params
  	params.require(:comment).permit(:content, :title, :id, :username, :pin_id)
  end 
end
