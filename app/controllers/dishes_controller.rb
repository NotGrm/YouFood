class DishesController < ClientController
  def show
    @dish = Dish.find(params[:id])
  end
end
