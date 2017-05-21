require 'pry'
class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :set_categories, only: [:edit, :new, :create, :update]
  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all
    @categories = Category.all
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @user = current_user
  end

  # GET /pins/new
  def new
    @user = current_user
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
    @user = User.find_by(id: params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.valid?
        @pin.category_id = params[:category].to_i
        @pin.user_id = current_user.id
        @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @pin.upvote_by(current_user)
    redirect_to :back
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def set_categories 
      binding.pry
      @category_options = Category.options 
    end 
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:title, :description, :image, :category, :link)
    end

end
