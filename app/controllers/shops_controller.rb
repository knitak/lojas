class ShopsController < ApplicationController
  
  def show
  	@shop = Shop.find(params[:id])
  end

  def new
  	@shop = Shop.new	
  end

  def create
  	@shop = Shop.new(params[:shop])
  	if @shop.save
  		flash[:success] = "Bem vindo/a"
  		redirect_to @shop
  	else
  		render 'new'
  	end
  end

  def index

    if params[:search].nil? && params[:category].nil? && params[:city].nil?
      @shops = Shop.all
    else
      @shops = Shop.search(params[:search], params[:category], params[:city])
    end
      @categories = Category.all
      @cities = City.all
  end
end
