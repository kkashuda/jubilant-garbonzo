require 'pry'

class CommentsController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]


def index 
	@comments = Comment.all

end 

def show 
  @comment = Comment.find(params[:id])
  respond_to do |format|
    format.html {render :show}
    format.json {render json: @comment }
  end 
end 

  def new
  	@user = current_user 
  	@comment = Comment.new 
  	respond_to do |f| 
  		f.js
  	end  
  end 

  def create
  	@comment = Comment.create(:title => params[:comment][:title], :content => params[:comment][:content])
  	@comment.pin_id = params[:pin_id]
  	if @comment.save 
  		render json: @comment, status: 201
  	else 
  		render json: @comment.errors, status: :unprocessable_entity
  	end 
end  



  private 

  def comment_params
  	params.require(:comment).permit(:content, :title, :id, :username, :pin_id)
  end 
end
