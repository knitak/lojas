class CategoriesController < ApplicationController
  
  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category created!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def index
  	@categories = Category.search(params[:search] )
  end
end