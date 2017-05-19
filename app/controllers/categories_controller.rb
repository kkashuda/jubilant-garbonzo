class CategoriesController < ApplicationController
  def index 
    @cateogories = Category.all
  end 
  
end
