class OrdersController < ClientController

  def show
    @order = current_order
  end

  def add_dish
    current_dish = Dish.find(params[:dish_id])
    order_line = current_order.add_dish(current_dish.id)
    order_line.save

    redirect_to orders_show_path
  end

  def remove_line
    current_line = OrderLine.find(params[:line_id])
    current_line.destroy

    redirect_to orders_show_path
  end
end
