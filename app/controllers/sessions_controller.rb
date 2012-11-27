class SessionsController < ApplicationController

	def new
		if shop = Shop.find_by_name(params[:name])
			#redirect_to shop
			#if @shop = Shop.find(params[:session][:id])	
			render 'show'
		end	
	end

	def show
		redirect_to shop_path
	end
end
