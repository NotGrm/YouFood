class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])

    @dishes = Dish.where(:category_id => @category.id)
  end
end
