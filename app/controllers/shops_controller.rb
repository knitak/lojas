class ShopsController < ApplicationController
  
  def show
  	@shop = Shop.find(params[:id])
    @category = @shop.create_category
  end

  def new
  	@shop = Shop.new 	
  end

  def create
  	@shop = Shop.new(params[:shop])
    @category = @shop.create_category
  	if @shop.save
  		flash[:success] = "Bem vindo/a"
  		redirect_to @shop
  	else
  		render 'new'
  	end
  end

  def index
    @shops = Shop.search(params[:search] )
  end
end
