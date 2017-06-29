class CommentsController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show]
   before_action :set_pin 


def index 
	@comments = @pin.comments
  respond_to do |format|
    format.html {render 'index.html', :layout => false}
    format.json {render 'index.js', :layout => false }
  end 
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
  respond_to do |format| 
  	format.html #new.html.erb
    format.json { render json: @comment}
  end  
end 

def create
  @comment = Comment.create(:title => params[:comment][:title], :content => params[:comment][:content], :pin_id => params[:pin_id])
  @comment.pin_id = params[:pin_id]
  render json: @comment, status: 201
end 

private 
  def comment_params
  	params.require(:comment).permit(:content, :title, :id, :username, :pin_id)
  end 

  def set_pin 
    @pin = Pin.find(params[:pin_id])
  end 
end
