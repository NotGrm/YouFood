class OrdersController < ClientController

  def show
    @order = current_order
  end

  def pay
  end

  def order
    @order = current_order
    @order.table_id = cookies[:table_number]

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, :notice => 'Order was successfully created.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "show" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
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
