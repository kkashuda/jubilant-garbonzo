require 'pry'
class CategoriesController < ApplicationController
  def index 
    @cateogories = Category.all
  end 

  def show 
    @category = Category.find_by(id: params[:id])
    @categories = Category.all
    @pins = @category.pins 
  end 
  
  
end
