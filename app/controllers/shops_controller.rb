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
    @shops = Shop.paginate(page: params[:page])    
  end
end
