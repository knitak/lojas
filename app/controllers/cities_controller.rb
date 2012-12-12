class CitiesController < ApplicationController
  
  def show
  	@city = City.find(params[:id])
  end

  def new
  	@city = City.new
  end

  def create
  	@city = City.new(params[:city])
    if @city.save
      flash[:success] = "City created!"
      redirect_to cities_path
    else
      render 'new'
    end
  end

  def index
  	@cities = City.all
  end
end
